//
//  WBMainViewController.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit


/// 主控制器
class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildControllers()
    }
}

extension WBMainViewController{
    
    /// 设置所有子控制器
    private func setupChildControllers(){
        
        let array = [
            ["clsName":"WBHomeViewController","title":"首页","imageName":"home"],
            ["clsName":"WBDiscoverViewController","title":"发现","imageName":"discover"],
            ["clsName":"WBMessageViewController","title":"消息","imageName":"message_center"],
            ["clsName":"WBProfileViewController","title":"个人","imageName":"profile"],
        ]
        
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
            //append的元素是controller(dict: dict)的返回值.
        }
        
        // 设置子控制器(viewControllers是UITabBarController的属性)
        viewControllers = arrayM
        
    }
    
   
    /// 使用字典创建一个子控制器
    ///
    /// - Parameter dict: 信息字典[clsName,title,imageName]
    /// - Returns: 子控制器
    private func controller(dict:[String:String]) -> UIViewController{
        // 1. 取得字典内容
       guard let clsName = dict["clsName"],
             let title = dict["title"],
             let imageName = dict["imageName"],
             let cls  = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
        else{
            
            return UIViewController()
        }
         
        // 2. 创建视图控制器
        let vc = cls.init()
        vc.title = title
        
        // 3. 图像设置
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)//注意可选属性.
        
        // 4. 设置标题字体
        // 在Swift3.0中,不是kCTForegroundColorAttributeName,是NSForegroundColorAttributeName
        // 测试发现这种写法在swift4.0中不可用.
        // button text attributes only respected for UIControlStateNormal, UIControlStateSelected, UIControlStateFocused, and UIControlStateDisabled. state = 1 is interpreted as UIControlStateSelected.
        
        // 根据xcode提示, 以下写法无效.
        //vc.tabBarItem.setTitleTextAttributes([kCTForegroundColorAttributeName as NSAttributedStringKey:UIColor.red], for: .highlighted)
        
        // tintColor也没有了, 最终实测发现只能如下写法(猜测设置图片也是类似的写法)
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedStringKey.foregroundColor : UIColor.orange],
            for: .highlighted)
        
        // 5. 调整文字大小(这里不可以设置.highlighted,因为没有主动设置高亮)
        //public static var highlighted: UIControlState { get } // used when UIControl isHighlighted is set
        
    vc.tabBarItem.setTitleTextAttributes(
        [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 11)],
        for: .normal)//系统默认是12号
        //self.tabBar.tintColor = UIColor.black
        
        // 注意写法变了, swift3.0 WBNavigationController(rootViewController:vc)
        let nav = WBNavigationController.init(rootViewController: vc)
        return nav
    }
    
    
}
