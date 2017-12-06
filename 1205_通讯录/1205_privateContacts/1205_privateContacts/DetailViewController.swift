//
//  DetailViewController.swift
//  1205_privateContacts
//
//  Created by toxicanty on 2017/12/5.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    
    var person:Person?
    
    var completionCallBack:(()->())? //闭包可选,不要写成下面的样子了
    //var completionCallBack:()->()?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 判断person是否有值
        
        if person != nil {
            nameTF.text = person?.name
            phoneTF.text = person?.phone
            titleTF.text = person?.title
        }
    }
    

    @IBAction func saveAction(_ sender: Any) {//swift3.0是AnyObject
        print("Save")
        
        // 1. 如果person为空, 实例化之, 使新建联系人的时候,能通过textField给实例赋值
        if person == nil{
            person = Person()
        }
        
        //2. person的地址还是之前的地址,赋值回去就可以了
        // 用UI更新person的内容
        person?.name = nameTF.text
        person?.title = titleTF.text
        person?.phone = phoneTF.text
        
        // 3. 执行闭包回调
        // oc里,执行block钱都必须判断是否有值, 否则容易崩溃.
        // !强行解包(一定不要!,要为每个惊叹号负责)
        // ?可选解包,如果闭包为nil,就什么都不做
        completionCallBack?()
        
        // 4. 返回上一级界面(不关心的返回值, 用_忽略一切不关心的东西)
       _ = navigationController?.popViewController(animated: true)
    }
    
}
