//
//  ViewController.swift
//  load_baidu
//
//  Created by toxicanty on 2017/12/4.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p = Person(name: "xiaofeng", age: 28)
        print("p === \(String(describing: p?.name?.description))")
        
        // 遍历构造函数, 可以返回nil
        guard let url = URL(string:"https://www.baidu.com/中文")else{
            return
        }
        // 发起网络请求
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let dataContent = data else {
                print("网络请求失败\(String(describing: error))")
                return
            }
            //data转string
            let html = String(data: dataContent, encoding: .utf8)//String.Encoding.utf8
            print(html ?? "空的值")
            }.resume()
    }
        
}

