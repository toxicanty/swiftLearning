//
//  WeiboCommon.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/27.
//  Copyright © 2017年 toxicanty. All rights reserved.
//

import Foundation

/// 用户需要登录通知
let WBUserShouldLoginNotification = "WBUserShouldLoginNotification"
/// appkey
let WBAPPKey = "4197688770"
/// 应用程序加密信息
let WBAPPSecret = "a7380a8c47b64e2922a44a082d413e4a"
/// 回调地址
let WBRedirectURI = "http://baidu.com"
/*
 client_id     string  申请应用时分配的AppKey。
 redirect_uri  string  授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地址。
 App Key：4197688770
 App Secret：a7380a8c47b64e2922a44a082d413e4a

 https://api.weibo.com/oauth2/authorize
 
 */
