//
//  ViewController.swift
//  循环引用以及解决
//
//  Created by toxicanty on 2017/11/30.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 声明变量
    var cpCompletion :(()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        loadData {
            print(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        print("I die")
    }
    
    func loadData(completion:@escaping ()->()) -> () {
        // 赋值给属性
        cpCompletion = completion
        
        DispatchQueue.global().async {
            completion()//
        }
    }

}

