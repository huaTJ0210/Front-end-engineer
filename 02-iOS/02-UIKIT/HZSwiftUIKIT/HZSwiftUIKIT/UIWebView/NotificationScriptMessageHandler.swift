//
//  NotificationScriptMessageHandler.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2020/12/16.
//  Copyright © 2020 HZ. All rights reserved.
//

import Foundation
import UIKit
import WebKit

/*
   遵守协议 实现接收JavaScript传递的消息数据
 */
class NotificationScriptMessageHandler: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
    }
    
}
