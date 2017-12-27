//
//  WBOAuthViewController.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/27.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class WBOAuthViewController: UIViewController {
    
    @objc  func close(){
        dismiss(animated: true, completion: nil)
    }
    
    private lazy var webView = UIWebView()
    
    override func loadView() {//UIViewController的方法
        view = webView//直接换了根视图,这也是一种思路
        view.backgroundColor = UIColor.white
        title = "登录新浪微博"
        // swift3.0中有isBack的属性, 如果为true,就有返回小箭头
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "回去", target: self, action: #selector(close))//style不要加.plain,不然就是系统的蓝色
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

