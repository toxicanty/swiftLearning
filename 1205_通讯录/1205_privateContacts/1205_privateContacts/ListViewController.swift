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
   
}
