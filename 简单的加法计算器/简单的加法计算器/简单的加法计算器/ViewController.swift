//
//  ViewController.swift
//  简单的加法计算器
//
//  Created by toxicanty on 2017/11/30.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 要访问文本框, 需要定义属性
    var numTxtF1 = UITextField()
    var numTxtF2 = UITextField()
    var result = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
    }
    //func setupUI{ 这样不可以,编译报错,必须要有参数列表,没有参数的时候也要有空括号
    //func setupUI(){ 这种写法可以
    func setupUI()->(){
        
        // swift 写法中, 多用function(),用ESC键补全函数全名, 会很有效率,跟之前的OC风格变化比较大,要习惯
        let textField1 = UITextField(frame: CGRect(x: 20, y: 20, width: 100, height: 30))
        textField1.borderStyle = .roundedRect
        textField1.text = "0"
        textField1.textAlignment = .center
        view.addSubview(textField1)
        
        let textField2 = UITextField(frame: CGRect(x: 140, y: 20, width: 100, height: 30))
        textField2.borderStyle = .roundedRect
        textField2.text = "0"
        textField2.textAlignment = .center
        view.addSubview(textField2)
        
        let label1 = UILabel(frame: CGRect(x: 120, y: 20, width: 20, height: 30))
        label1.text = "+"
        label1.textAlignment = .center
        view.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect(x: 260, y: 20, width: 20, height: 30))
        label2.text = "="
        label2.textAlignment = .center
        view.addSubview(label2)
        
        let label3 = UILabel(frame: CGRect(x: 280, y: 20, width: 60, height: 30))
        label3.text = "0"
        label3.textAlignment = .center
        view.addSubview(label3)
        
        let btn = UIButton()
        btn.setTitle("计算", for: UIControlState.normal)
        btn.backgroundColor = UIColor.red
        btn.setTitleColor(UIColor.green, for: UIControlState.normal)
         btn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btn.sizeToFit()
        btn.center = view.center
        btn.addTarget(self, action: #selector(btnAction(sender:)), for: UIControlEvents.touchUpInside)
        //    无参数的处理
        // btn.addTarget(self, action: #selector(btnAction), for: UIControlEvents.touchUpInside)
        view.addSubview(btn)
        
        // 记录盛行
        numTxtF1 = textField1
        numTxtF2 = textField2
        result = label3
    }
    //    无参数的处理
    //    @objc func btnAction()->(){
    //        print("btnClicked")
    //    }
    @objc func btnAction(sender btn:UIButton)->(){
        //print("btnClicked---\n\(btn)")//no sender, sender是外部参数, \n换行是生效的.
        // 注意这里的带引方法也变了, 以前是print("\(numTxtF1?.text)")
        //print("\(String(describing: numTxtF1.text))-----\(String(describing: numTxtF2.text))")
        
        guard let num1 = Int(numTxtF1.text ?? ""),let num2 = Int(numTxtF2.text ?? "") else {
            print("必须输入数字")
            return
        }
        // 正常处理流程:计算结果
        result.text = "\(num1 + num2)"
    }
}

