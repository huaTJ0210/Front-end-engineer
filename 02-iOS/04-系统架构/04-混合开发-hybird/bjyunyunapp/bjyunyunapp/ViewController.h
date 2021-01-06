//
//  ViewController.h
//  bjyunyunapp
//
//  Created by 华天杰 on 2020/12/16.
//  Copyright © 2020 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@interface ViewController : UIViewController<WKNavigationDelegate>

@property(nonatomic,copy)NSString* pageURL;
@end

