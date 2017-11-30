//
//  ViewController.swift
//  githubUploadTest
//
//  Created by toxicanty on 2017/11/27.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*******************create button************************/
        let btn = UIButton()
        // There was a bug here once before, you can not call .normal out
        // In this condition, you can use "UIControlState(rawValue:0)"
        btn.setTitle("myButton", for: UIControlState.normal)
        btn.sizeToFit()
        btn.setTitleColor(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1), for: UIControlState.normal)
        btn.setTitleColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), for: UIControlState.highlighted)
        
        // notice: not @ now, replaced with # and sender is outside pram, coincident with the func below.
        btn.addTarget(self, action: #selector(btnAction(sender:)), for: UIControlEvents.touchUpInside)
        btn.center = self.view.center
        view.addSubview(btn)
        
       /*******************fuction Formate************************/
        //20171127 22:00 normal function
        let a = sum(x: 1, y: 2)
        print("a = \(a)")
        /// external parameter looks more elegant
        let b = sum2(firstNum: 3, secondNum: 4)
        print("b = \(b)")
        let c = sum3(4, 5)
        print("c = \(c)")
        print("d = \(sum4())")
        print("f = \(sum4(x: 1, y: 1))")
        // you can also just pass part of the all params to function, like below:
        // That's cool and more convenient that Objective-C(not need to define lots of funcs).
        let g = sum4(y: 6)
        print("g = \(g)")//6+1(default value) == 7
        /*******************for loop with underline************************/
        for _ in 0..<3{// no space between number ands symbols
            print("aaa")
        }
        
        for i in 0..<3{// no space between number ands symbols
            print("i = \(i)")
        }
        
        print("test functions that do no return value:")
        function1(x: 1, y: 1)
        function2(x: 1, y: 1)
        function3(x: 1, y: 1)
        print("ALL OK !!!")
        /*******************closure************************/
        // In Objective-C, block is an anonymous Function
        // In Swift, Function is a special Closure
        let functionParam = sum4
        // Be as a function param, call when you need
        print("anonymous function Value == \(functionParam(1,2))")
        
        /// 1. the easiet closure,
        // option + Click to see : () -> (), no param , no returned value
        let easiest = {
            print("the easiest Closure looks like block of code")
        }
        
        /**
         Compare with a easiest block
         void (^b)() = ^{
         NSLog("I am a block");
         };
         // call the block
         b();
         */
        easiest()// Call the closure
        print(easiest)
        
        /// 2 . closure with param
        let normal = { (x:Int,y:Int)->Int
            in // this "in" is used for seprate the "definion" with the "implement"
            return x+y
        }
        print("demo test: closure with param")
      let normalC =  normal(100,200)
        print("demo test: closure with param = \(normalC)")
        
        //loadData()
        loadData {(result) in
            print("get the news = \(result)")
        }
    }
    
    /*******************Change of GCD************************/
    //func loadData() -> (){
    func loadData(completion:@escaping (_ result:[String])->()) -> (){
        ///Users/toxicanty/Desktop/githubUploadTest/githubUploadTest/ViewController.swift:98:32: Function types cannot have argument labels; use '_' before 'result'
        DispatchQueue.global().async {//async = 异步, sync = 同步
            print("Opration which takes lots of time \(Thread.current)")// number = 3
            
            // sleep
            Thread.sleep(forTimeInterval: 1.0)
            
            // some data need to use outside like block
            let json = ["news1","new2","new3"]
            
            
            // mark: 在global的括号内
            DispatchQueue.main.async {
                print("mainThread refresh UI \(Thread.current)") // number = 1, mainThread
                // 回调 -> 执行 closure(get the data from closure)
                completion(json)
            }
        }
    }
    
    
    
    
    
    // notice that swift2.2 did not use @objc in the front
    @objc func btnAction(sender btn:UIButton){
        print("Did clicked the button")
    }
    
    func sum(x:Int, y:Int) -> Int{
        return x+y
    }
    
    // FULL formate , ()means call , -> means return value
    func sum2(firstNum x:Int,secondNum y:Int) -> Int{
        return x+y
    }
    
    ///  _ means which is not so important, when call, you can ignore
    func sum3(_ x:Int,_ y:Int) -> Int{
        return x+y
    }
    
    /// if the function itself has value,you need not to pass value to the function.
    func  sum4(x:Int = 1,y:Int = 2) -> Int {
        return x+y
    }
    /*******************no retured value************************/
    
    func function1(x:Int, y:Int) ->(){
        print("demo1")
    }
    func function2(x:Int, y:Int) -> Void{
        print("demo2")
    }
    func function3(x:Int, y:Int){
        print("demo3")
    }
}

