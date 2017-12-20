//
//  WBVisitorView.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/18.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit


/// 访客视图
class WBVisitorView: UIView {
    
    // 1219 21:30 因为注册和登录按钮,耦合性不强, 所以直接可以开放给baseViewController使用...
    // 不一定非要通过代理和闭包来处理时间
    /// 注册按钮
     lazy var registerButton:UIButton = UIButton.yw_textButton("注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
    /// 登录按钮
     lazy var loginButton:UIButton = UIButton.yw_textButton("登录", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
    
    // 1219 14:30 考虑每个控制器都有一个访客视图,但是它们显示的图片不一样
    // 可以设计一个外部访问的字典, 通过在不同控制器给该字典设置值, 来定制visitorView的显示
    //'lazy' may not be used on a computed property/lazy不可以用于计算属性.
     var visitorInfo :[String : String]? {
        didSet{
            // 1> 取字典
            guard let imageName = visitorInfo?["imageName"],
                let message = visitorInfo?["message"] else {
                    return
            }
            // 2> 设置消息
            tipLabel.text = message
            tipLabel.textAlignment = .center
            
            // 3> 设置图像
            if imageName == ""{
                //  旋转动画
                startAnimation()
                return
            }
            
            iconView.image = UIImage(named: imageName)
            houseIconView.isHidden = true //其他控制器不需要显示小房子
            maskIconView.isHidden = true
        }
        
    }

    // 先写构造函数,程序入口
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UI
        setupUI()
    }
    
    /// MARK: - 旋转动画
    private func startAnimation(){
        
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2 * Double.pi
        anim.repeatCount = MAXFLOAT
        anim.duration = 15
        // 完成后不删除
        anim.isRemovedOnCompletion = false
        // 添加到对应view的图层
        iconView.layer.add(anim, forKey: nil)
    }
    
    // 写完上面的就自己出来的
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 私有控件
    /// 图像视图
    private lazy var iconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    /// 蒙版
    private lazy var maskIconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    /// 小房子
    private lazy var houseIconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    /// 提示标签(返回值是instance)
    private lazy var tipLabel:UILabel = UILabel.yw_label(withText: "关注一些人,看看这里有什么惊喜", fontSize: 14, color: UIColor.gray)
    
    
}


extension WBVisitorView{
    
    func setupUI(){
        backgroundColor = UIColor.white
        
        // 1. 添加控件
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(houseIconView)
        addSubview(tipLabel)
        addSubview(registerButton)
        addSubview(loginButton)
       
        
        // 2. 取消autoresizing
        // autoresizing和autoLayout不能共存(纯代码默认autoresizing, xib默认autoLayout)
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 3. 自动布局
        // 1> iconView
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))//向上偏移60
        // 2> houseView(注意此时参照对象是iconView)
        addConstraint(NSLayoutConstraint(item: houseIconView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: houseIconView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 0))
        // 3> 提示标签(水平中心对齐,x方向)
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        // y方向
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .top, relatedBy:.equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 20))
        // 指定宽度,让label换行
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .width, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150))
        // 4> 注册按钮
        addConstraint(NSLayoutConstraint(item: registerButton, attribute:.left, relatedBy: .equal, toItem: tipLabel, attribute: .left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .top, relatedBy:.equal, toItem: tipLabel, attribute: .bottom, multiplier: 1.0, constant: 20))
        // 宽度 toItem:nil attribute:.notAnAttribute/.width/宽度值
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .width, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60))
        // 5> 登录按钮
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .right, relatedBy:.equal, toItem: tipLabel, attribute: .right, multiplier: 1.0, constant: 0))
        // 宽度 toItem:nil attribute:.notAnAttribute/.width/宽度值
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60))
         addConstraint(NSLayoutConstraint(item: loginButton, attribute: .top, relatedBy: .equal, toItem: tipLabel, attribute: .bottom, multiplier: 1.0, constant: 20))
        // 6> mask蒙版
        addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .width, relatedBy: .equal, toItem: iconView, attribute: .width, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .height, relatedBy: .equal, toItem: iconView, attribute: .height, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 0))
        
        // 也可以用vfl语言来写, 这里不演示了.
    }
    
}
