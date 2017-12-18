//
//  WBTestViewController.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/13.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class WBTestViewController: WBBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = String(describing: navigationController?.childViewControllers.count ?? 0)
        
    }
    
   @objc private func nextVC(){
        print("下一个控制器")
    let vc  = WBTestViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setupUI(){
        
        // 这里不写了, super.setupUI()去处理
        //view.backgroundColor = UIColor.yw_random()
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", style: .plain, target: self, action: #selector(nextVC))
        
        //let btn: UIButton = UIButton.yw_textButton("下一个", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//        btn.addTarget(self, action: #selector(nextVC), for: UIControlEvents.touchUpInside)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个",  target: self, action: #selector(nextVC))
        // 优化:
        // 1218 撤销自定义方式, 因为statusbar上面的20个像素没法处理.
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个",  target: self, action: #selector(nextVC))
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个",  target: self, action: #selector(nextVC))
        
        
        super.setupUI()
    }
}


extension WBTestViewController{
    
    
    
}
