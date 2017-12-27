//
//  WBOAuthViewController.swift
//  Weibo_demo
//
//  Created by toxicanty on 2017/12/27.
//  Copyright © 2017年 toxicanty. All rights reserved.
//



import UIKit
import SVProgressHUD//1228

class WBOAuthViewController: UIViewController {
    
    @objc  func close(){
        SVProgressHUD.dismiss()//出界面的都关掉
        dismiss(animated: true, completion: nil)
    }
    
    @objc func autoFill(){
        // 准备js
        let js = "document.getElementById('userId').value = 'donkey1@qq.com';" + "document.getElementById('passwd').value = '801103fyz@';"
        // 让webView执行js
        webView.stringByEvaluatingJavaScript(from: js)
        
    }
    
    private lazy var webView = UIWebView()
    
    override func loadView() {//UIViewController的方法
        view = webView//直接换了根视图,这也是一种思路
        view.backgroundColor = UIColor.white
        
        webView.delegate = self
        webView.scrollView.isScrollEnabled = false//不让上下拖拽
        title = "登录新浪微博"
        // swift3.0中有isBack的属性, 如果为true,就有返回小箭头
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "回去", target: self, action: #selector(close))//style不要加.plain,不然就是系统的蓝色
        
        navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "自动填充", target: self, action: #selector(autoFill))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 加载授权页面
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(WBAPPKey)&redirect_uri=\(WBRedirectURI)"
        
        // 1> url 确定要访问的资源
        guard let url = URL(string: urlString) else {
            return
        }
        
        // 2> 请求
        let request = URLRequest(url: url)
        
        // 3> 加载页面
        webView.loadRequest(request)
    }
}

extension WBOAuthViewController:UIWebViewDelegate {
    
    
    /// webView 将要加载请求
    ///
    /// - Parameters:
    ///   - webView: webView
    ///   - request: 要加载的请求
    ///   - navigationType: 导航类型
    /// - Returns: 是否记载request
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        // 1. 如果请求地址中包含baidu.com就加载页面, 否则不加载
        // swift3.0中是absoluteString?
        if request.url?.absoluteString.hasPrefix(WBRedirectURI) == false {
            return true
        }
        print("加载请求 ==== \(request.url?.absoluteString)")
        // URL中'?' 后面的一串都是query
        print("加载请求 --- \(request.url?.query)")
        // 2. 找'code='后面的东西就是要的
        if request.url?.query?.hasPrefix("code=") == false{
            print("取消授权")
            // 回到之前的界面
            close() // 返回按钮调用的方法
            return false
        }
        // 3. 从query字符串中取出授权码
        //'substring(from:)' is deprecated: Please use String slicing subscript with a 'partial range from' operator.
        //request.url?.query?.substring(from: "code=".endIndex)
        //4c423afa49348ece84b913cb068e4a4f
        
//        let code = request.url?.query?.sub\
        guard let q = request.url?.query else {
            //Non-void function should return a value
           return false
        }
        
        
      let code = q["code=".endIndex ..< q.endIndex]//是substring类型
        print("获取授权码====\(code)")
        //9683a11b34bbcf6bf743c0f40304b2d4
        //与之前格式相同,于是code是我们要的授权码
        
        // 4. code还不是完整的,还需要拼一个请求,才能获得token
        //https://api.weibo.com/oauth2/access_token
        WBNetworkManager.shared.loadAccessToken(code: String(code))
        return true
    }
    
    // 1228 加载网络开始时,显示hud,完成时关闭hud
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
}

