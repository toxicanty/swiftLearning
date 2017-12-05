//
//  ListViewController.swift
//  1205_privateContacts
//
//  Created by toxicanty on 2017/12/5.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

     // 联系人数组
    var personList = [Person]()
    //var cell:UITableViewCell
    override func viewDidLoad() {
        super.viewDidLoad()

        
        loadData { (list) in
            print(list)
            
            // 拼接数组
            self.personList += list
            // 刷新表格
            self.tableView.reloadData()
        }
    }
    
    // 模拟异步加载,利用闭包毁掉
    private func loadData(completion: @escaping (_ list:[Person]) -> ()) -> (){
    // swift3.0 写法
    //private func loadData(completion:(list:[Person]) -> ()) -> ()
        DispatchQueue.global().async {
            print("on loading...")
            
            Thread.sleep(forTimeInterval: 1.0)
            
            var arrayM = [Person]()
            
            for i in 0..<20{
                let p = Person()
                
                p.name = "zhangsan - \(i)"
                p.phone = "1860" + String(format: "%06d", arc4random_uniform(10000000))
                p.title = "boss"
              
                arrayM.append(p)
            }
            
            // 主线程回调
            DispatchQueue.main.async(execute: {
                // huidiao闭包
                completion(arrayM)
                // swift3.0
                //completion(list:arrayM)
            })
            
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "cellabc", for: indexPath)
        //tableView.register(_, forCellReuseIdentifier: "cellId")
        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phone
        return cell
    }
    
    // mark: 控制器跳转方法
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // as! 或 as? 直接根据它前面变量的返回值来确定(直观来说,destination按optional+click没问号)
        // 注意, if let/guard let 判空语句中, 一律使用as?
        let vc = segue.destination as! DetailViewController//as是类型强转
        //swift3.0 is destinationViewController
        
        if let  indexPath =  sender as? IndexPath{
            vc.person = personList[indexPath.row]
        }
        
    }
    
//    mark:代理方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // segue
        performSegue(withIdentifier: "list2detail", sender: indexPath)
    }
    
}
