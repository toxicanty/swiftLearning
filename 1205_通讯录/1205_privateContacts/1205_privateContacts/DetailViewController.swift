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
    }
    
}
