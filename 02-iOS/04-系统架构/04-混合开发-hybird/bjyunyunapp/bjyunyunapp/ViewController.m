//
//  ViewController.m
//  bjyunyunapp
//
//  Created by 华天杰 on 2020/12/16.
//  Copyright © 2020 HZ. All rights reserved.
//

#import "ViewController.h"
#import "WebViewJavascriptBridge.h"
#import "ConsoleVC.h"
#import "AppConfig.h"
@interface ViewController ()
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) WebViewJavascriptBridge* bridge;
@end

@implementation ViewController

/*
   https://mock.bjfj.zhongchebaolian.com/bjfjappweb/web/index.htm
 */

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.orangeColor;
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webView.navigationDelegate = self;
    
//    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@",[AppConfig instance].baseURL,[AppConfig instance].baseDir,self.pageURL]];
    [self loadPage];
    [self.view addSubview:self.webView];
    if(!_bridge){
        _bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView
                                              showJSconsole:YES
                                              enableLogging:YES];
    }
    [_bridge registerHandler:@"BQJSBridgeService" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"ObjC Echo called with: %@", data);
        /*
                 {
                 "FUNC_NAME" = callApp;
                 "FUNC_PARAMS" =     {
                 age = 18;
                 name = li;
                 };
         */
        NSString* funcName = data[@"FUNC_NAME"];
        NSDictionary* params = data[@"FUNC_PARAMS"];
        //书写基本业务原生逻辑
        if([funcName isEqualToString:@"firstPageClick"]){
            responseCallback(@{@"name":@"first page data from app"});
        }else if([funcName isEqualToString:@"secondPageClick"]){
            responseCallback(@{@"name":@"second page data from app"});
        }else if([funcName isEqualToString:@"openConsole"]){
            ConsoleVC* vc = [[ConsoleVC alloc] init];
            __weak __typeof(self)weakSelf = self;
            vc.dismissBlock = ^{
                [weakSelf loadPage];
            };
            [self presentViewController:vc animated:YES completion:nil];
        }
        else{
            
        }
    }];
    // 原生根据web页面需要被调用的函数名直接调用
    [self performSelector:@selector(callJSMethod) withObject:nil afterDelay:3.0];
}

-(void)loadPage{
    NSURL* url = [NSURL URLWithString:[AppConfig instance].baseURL];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request];
}

-(void)callJSMethod{
    [_bridge callHandler:@"appCallJS" data:@{@"name":@"hua"} responseCallback:^(id responseData) {
        NSLog(@"ObjC received response: %@", responseData);
    }];
}


- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"webViewDidStartLoad");
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"webViewDidFinishLoad");
    [webView evaluateJavaScript:@"document.documentElement.style.webkitUserSelect='none'" completionHandler:nil];
    [webView evaluateJavaScript:@"document.documentElement.style.webkitTouchCallout='none'" completionHandler:nil];
}

//- (void)loadExamplePage:(WKWebView*)webView {
//    NSString* htmlPath = [[NSBundle mainBundle] pathForResource:@"ExampleApp" ofType:@"htm"];
//    NSString* appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
//    double timeInterval = [[NSDate alloc] init].timeIntervalSinceNow;
//    htmlPath = [NSString stringWithFormat:@"%@?timestamp=%lf",htmlPath,timeInterval];
//    NSURL *baseURL = [NSURL fileURLWithPath:htmlPath];
//    [webView loadHTMLString:appHtml baseURL:baseURL];
//}


@end
