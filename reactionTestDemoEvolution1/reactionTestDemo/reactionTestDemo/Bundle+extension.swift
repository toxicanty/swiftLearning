//
//  Bundle+extension.swift
//  reactionTestDemo
//
//  Created by toxicanty on 2017/12/7.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import Foundation

extension Bundle{

    var namespace: String {
        return  infoDictionary?["CFBundleName"] as? String ?? ""
        }
}

