//
//  HZSampleWebViewViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/19.
//  Copyright © 2018年 HZ. All rights reserved.
/*
    WKWebView
 */

import UIKit
import WebKit

class HZSampleWebViewViewController: UIViewController ,WKUIDelegate,WKNavigationDelegate{
    
    var config: WKWebViewConfiguration?
    var wkWebView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
       configWKWebView()
        wkWebView = WKWebView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), configuration: config!)
        // 设置UI代理
        wkWebView?.uiDelegate = self
        // 设置 导航代理
        wkWebView?.navigationDelegate = self
        // 加载网页内容
        loadWebPage()
        view.addSubview(wkWebView!)
    }
    
   // WKWebView进行配置
    func configWKWebView(){
        //创建网页配置对象
        config = WKWebViewConfiguration()
        // 创建设置对象
        //let  preference = WKPreferences()
        
        /*
          (1) 使用用户脚本注入javscript
          (2) func evaluateJavaScript(javaScriptString: String!, completionHandler: ((AnyObject!, NSError!) -> Void)!)
         */
        let source = "document.body.style.background = \"#777\";"
        let userScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScript)
        
        // 创建接收JavaScript的消息接收对象
        let handler = NotificationScriptMessageHandler()
        userContentController.add(handler, name: "notification")
    
        config!.userContentController = userContentController
   
    }
    
    func loadWebPage(){
       let webPath =  Bundle.main.path(forResource: "demo", ofType: "htm")
        if let webpath = webPath{
            do{
                let appHtml =   try String(contentsOfFile: webpath, encoding: String.Encoding.utf8)
                let url = URL(fileURLWithPath: webpath)
                wkWebView?.loadHTMLString(appHtml, baseURL: url)
            }catch{
                
            }
        }
      
    }
    
}
