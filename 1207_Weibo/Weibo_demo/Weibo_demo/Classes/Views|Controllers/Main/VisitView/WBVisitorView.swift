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

    // 先写构造函数,程序入口
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UI
        setupUI()
    }
    
    // 写完上面的就自己出来的
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 私有控件
    /// 图像视图
    private lazy var iconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    /// 小房子
    private lazy var houseIconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    /// 提示标签(返回值是instance)
    private lazy var tipLabel:UILabel = UILabel.yw_label(withText: "关注一些人,看看这里有什么惊喜", fontSize: 14, color: UIColor.gray)
    /// 注册按钮
    private lazy var registerButton:UIButton = UIButton.yw_textButton("注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
    /// 登录按钮
    private lazy var loginButton:UIButton = UIButton.yw_textButton("登录", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
}


extension WBVisitorView{
    
    func setupUI(){
        backgroundColor = UIColor.white
        
        // 1. 添加控件
        addSubview(iconView)
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
        // 1> houseView(注意此时参照对象是iconView)
        addConstraint(NSLayoutConstraint(item: houseIconView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: houseIconView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 0))
    }
    
}
