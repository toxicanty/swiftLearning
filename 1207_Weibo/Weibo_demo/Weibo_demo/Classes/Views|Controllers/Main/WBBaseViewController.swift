//
//  WBBaseViewController.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //PROGRAM MARK : FSFSDF
    // 没有登录,就不创建
    var tableView: UITableView?
    //刷新控件
    var refreshControl: UIRefreshControl?
    
    /// 上拉刷新标记
    var isPullup =  false
    
    // 自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.yw_screenWidth(), height: 64))

    // 自定义导航条目
    lazy var navItem = UINavigationItem()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - 设置界面
        setupUI()
        // MARK: - 加载数据
        loadData()
    }
    
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }
    
   func setupUI(){
        view.backgroundColor = UIColor.yw_random()
        setupNav()
        setupTableView()
    //'automaticallyAdjustsScrollViewInsets' was deprecated in iOS 11.0: Use UIScrollView's contentInsetAdjustmentBehavior instead
    
    }
    
    // 空方法, 具体实现要子类自己去实现
    // 1218 现在要加上objc, 因为要对应下拉刷新的target方法...
    @objc func loadData(){
        
        
    }
    // MARK: - 设置导航栏
    func setupNav(){
        UIApplication.shared.isStatusBarHidden = false
        navigationBar.items = [navItem]
        // 添加导航条
        view.addSubview(navigationBar)
        // 设置渲染颜色(原来的太亮了,透明效果不太好看)
        navigationBar.barTintColor = UIColor.yw_color(withHex: 0xF6F6F6)
        //navigationBar.setTitleVerticalPositionAdjustment(10, for: UIBarMetrics.default)
    }
    // MARK: - 设置tableView
    func setupTableView(){
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, at: 0)
       
        //  设置数据源和代理, 子类直接实现数据源方法
        tableView?.delegate = self
        tableView?.dataSource = self
        
        // 位置调整
        // swift3.0中的实现
        //automaticallyAdjustsScrollViewInsets = false
        // swift4.0中的实现
        tableView?.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        
        // 挡住的显示出来(bottom是把底部的位置显示出来,不要被tabbar挡住)
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 0, right: 0)
        
        // 设置刷新控件
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
    }
    
    // MARK: - tableView的代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    /// 在显示最后一行时,上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       // 1. 判断indexPath是否是最后一行(最大section中,最大的row)
        let row = indexPath.row
        //2.
        let section = tableView.numberOfSections - 1
        
        print("section -- \(section)")
        
        if(row < 0 || section < 0) {
        return
        }

        // 如果是最后一行,且没有开始上拉刷新
        let count = tableView.numberOfRows(inSection: section)
        
        if(row == count - 1) && !isPullup{
            print("上拉刷新")
            
            isPullup = true
            
            // 开始刷新
            loadData()
        }
        
    }
    
    
}

// 不在允许在extension中去实现代理方法
//extension WBBaseViewController: UITableViewDelegate, UITableViewDataSource{
//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return 0
//}
//
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    return UITableViewCell()
//}
//}

