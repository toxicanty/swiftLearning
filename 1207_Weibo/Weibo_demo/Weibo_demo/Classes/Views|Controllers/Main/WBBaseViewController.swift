//
//  WBBaseViewController.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
   private var logon = false
    
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
    
    // 访客视图字典信息, 外部传递
    var vistorInfoDict:[String : String]?
    

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
    
    // 1219 22:00 因为其他控制器继承时使用的都是登录后的(首页-登录后-导航栏-好友按钮)
    // 实际上都是setupTableView中的复用
    // 所以考虑将setupUI私有, 将setupVisitView开放
  private func setupUI(){
        view.backgroundColor = UIColor.yw_random()
        setupNav()
    
    //setupTableView()
    logon ? setupTableView() : setupVisitView()
    
    // automaticallyAdjustsScrollViewInsets' was deprecated in iOS 11.0: Use UIScrollView's contentInsetAdjustmentBehavior instead
    
    }
    
    // 空方法, 具体实现要子类自己去实现
    // 1218 现在要加上objc, 因为要对应下拉刷新的target方法...
    @objc func loadData(){
        // 如果没有重写loadData应该让菊花停止
        refreshControl?.endRefreshing()
    }
    // MARK: - 设置导航栏
    func setupNav(){
        UIApplication.shared.isStatusBarHidden = false
        navigationBar.items = [navItem]
        // 添加导航条
        view.addSubview(navigationBar)
        // 1>设置整个背景的渲染颜色(原来的太亮了,透明效果不太好看)
        navigationBar.barTintColor = UIColor.yw_color(withHex: 0xF6F6F6)
        //navigationBar.setTitleVerticalPositionAdjustment(10, for: UIBarMetrics.default)
        // 2>设置navBar字体颜色
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.darkGray]
        // 3>设置系统文字颜色
        navigationBar.tintColor = UIColor.orange
    }
    // MARK: - 设置没有登录时的界面
    func setupVisitView(){
        print("没有登录时候的界面 -- 设置访客视图")
        
        let visitorVIew = WBVisitorView(frame: view.bounds)
        view.insertSubview(visitorVIew, belowSubview: navigationBar)
        
        // 1> 设置访客视图信息
        visitorVIew.visitorInfo = vistorInfoDict//基类控制器获得的字典,传递给vistorVIew处理.
        
        // 2> 给注册登录按钮添加事件
        visitorVIew.loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        visitorVIew.registerButton.addTarget(self, action: #selector(registAction), for: .touchUpInside)
        
        // 3> 设置导航条按钮
        navItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(registAction))
        navItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(loginAction))
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
        
        // 添加监听方法
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

extension WBBaseViewController{
    
    @objc func loginAction(){
        print(#function)
    }
    
    @objc func registAction(){
        print(#function)
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

