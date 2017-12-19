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
        setComposeButton()
        
        
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{

        return .portrait
    }
    //懒加载按钮
    private lazy var composeButton: UIButton = UIButton.yw_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    
    @objc private func composeMessage(sender btn:UIButton)->(){
        print("点击了发送微博按钮")
        print(btn)
    }
    
    
}

extension WBMainViewController{
    
    /// 设置所有子控制器
    private func setupChildControllers(){
        
        let array = [
            ["clsName":"WBHomeViewController",
             "title":"首页","imageName":"home",
             "visitorInfo":["imageName":"","message":"关注一些人,回这里看看有什么惊喜"]],
            
            ["clsName":"WBDiscoverViewController","title":"发现","imageName":"discover",
             "visitorInfo":["imageName":"visitordiscover_image_message","message":"登录后,别人评论你的微博,都会在这里收到通知"]],
            
            ["clsName":"WBDiscoverViewController"],
            
            ["clsName":"WBMessageViewController","title":"消息","imageName":"message_center",
             "visitorInfo":["imageName":"visitordiscover_image_message","message":"登陆后,最新最热微博尽在掌握"]],
            
            ["clsName":"WBProfileViewController","title":"个人","imageName":"profile",
             "visitorInfo":["imageName":"visitordiscover_image_profile","message":"登陆后,你的微博,相册,个人资料会显示在这里,展示给别人"]],
        ]
        
        // 测试转换成plist
        //(array as NSArray).write(toFile: "/Users/toxicanty/Desktop/demo.plist", atomically: true)
        
      let data = try! JSONSerialization.data(withJSONObject: array, options: [])//OC写0,swift写[]
     (data as NSData).write(toFile: "/Users/toxicanty/Desktop/demo.json", atomically: true)
        
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
    /// - Parameter dict: 信息字典[clsName,title,imageName,"visitorInfo"],
    /// - Returns: 子控制器
    private func controller(dict:[String:Any]) -> UIViewController{
        
        // 1. 取得字典内容
        guard let clsName = dict["clsName"] as? String,//强转
             let title = dict["title"] as? String,
             let imageName = dict["imageName"] as? String,
             let cls  = NSClassFromString(Bundle.main.namespace + "." + clsName) as? WBBaseViewController.Type,
        let visitorDict = dict["visitorInfo"] as? [String : String]
        else{
            return UIViewController()
        }
         
        // 2. 创建视图控制器
        let vc = cls.init()
        vc.title = title
        
        // 2.1 1219 补充:
        vc.vistorInfoDict = visitorDict
        
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
            for: .selected)
        
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
    
    private func setComposeButton(){
        tabBar.addSubview(composeButton)
        // 计算按钮位置,方法1
        //let count = CGFloat(childViewControllers.count)//整数转浮点
        //let w = tabBar.bounds.width / count
        
        //composeButton.frame = CGRect(x:composeButton.frame.origin.x + 2*w, y: composeButton.frame.origin.x, width: composeButton.frame.size.width, height: composeButton.frame.size.height)
        // 也可以CGRectInset 整数向内缩进,辅助向外扩展.
        
       // 方法2
        composeButton.center = CGPoint(x: tabBar.center.x, y: composeButton.center.y)
        composeButton.addTarget(self, action: #selector(composeMessage(sender:)), for: UIControlEvents.touchUpInside)
    }
    

}
