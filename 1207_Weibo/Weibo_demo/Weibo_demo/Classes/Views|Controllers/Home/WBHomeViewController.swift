//
//  WBHomeViewController.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI(){
        super.setupUI()
        
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriend))
        //navItem.title
    }
    
    @objc private func showFriend(){
        print(#function)
        let vc = WBTestViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    @objc private func btnAction(){
//        print(#function)
//    }
}

extension WBHomeViewController{
    
}


