//
//  WBHomeViewController.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

// 可重用cell(全局常量, 尽量使用private ,否则到处都可以访问)
private let cellId = "cellId"

class WBHomeViewController: WBBaseViewController {
    
//    private lazy var statusList = [String]()//懒加载空数组,()表示空.
    // 1221 改成viewModel加载数据
    private lazy var listModel = WBStatusListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - 延迟加载数据
    override func loadData() {
        
        listModel.loadStatus(pullup: self.isPullup) { (isSuccess,shouldRefresh) in
            // 加载完成数据后,停止控件
            self.refreshControl?.endRefreshing()
            // 恢复标记
            self.isPullup = false
            
            if shouldRefresh {
                // 刷新数据
                self.tableView?.reloadData()
                print("刷新表格")
            }// 其他不需要刷新表格
        }
        
        /***********************************************/
        // 1220 先在此处测试网络访问是否ok
//        WBNetworkManager.shared.get(URLString, parameters: params, progress: nil, success: { (_, json) in
//            print("json-------\(json ?? "xxxxx错误xxxxx")")
//        }) { (_, error) in
//            print("网络请求失败---\(error)")
//        }
        /***********************************************/
        
        //1220 19:30 优化1:改用封装方法来处理
//        WBNetworkManager.shared.request(urlString: URLString, parameters: params) { (json, isSuccess) in//请求的内容, 成功否
//            print("json ==== \(json ?? "")")
//        }
        
        //1220 22:30 优化2:进一步优化后,处理更简单,直接得到微博数组
        //1227 这里就不用了
//        WBNetworkManager.shared.statusList(since_id: 0,max_id: 0) { (statuses, isSuccess) in
//            print("网络请求成功")
//        }
    }
    
    override func setupTableView(){
        
        super.setupTableView()
        
        // 注释掉:下面优化
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriend))
        // 虽然直接改navigationBarItem的颜色为橙色可以, 但是一个UI细节,在左边侧右滑返回上层时,按钮文字的颜色很模糊, 并不是很好的体验. 所以,最好用自定义方式处理, 做一个橙色按钮.
        
        // 优化1: 自定义方式处理
//        let btn: UIButton = UIButton.yw_textButton("好友", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//        btn.addTarget(self, action: #selector(showFriend), for: UIControlEvents.touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        // 优化2: 简化代码...
//      navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriend))
        
        // 优化3: 改成自定义的
        // 1218 撤销自定义方式, 因为statusbar上面的20个像素没法处理.
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriend))
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriend))
        
        // 注册原型cell, 注意: 在重写父类的setupUI方法内处理.
        // 这里和OC的差别很大
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    @objc private func showFriend(){
        print(#function)
        let vc = WBTestViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    @objc private func btnAction(){
//        print(#function)
//    }
    
    // swift3.0中,可以写在extension中. swift4.0中,必须写在这里
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModel.statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. 取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        // 2. 设置cell
        cell.textLabel?.text = listModel.statusList[indexPath.row].text
        
        // 3. 返回cell
        return cell
    }
    
}

extension WBHomeViewController{
    
    
    
}


