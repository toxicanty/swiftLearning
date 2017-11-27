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
    }
    // notice that swift2.2 did not use @objc in the front
    @objc func btnAction(sender btn:UIButton) {
        print("Did clicked the button")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

