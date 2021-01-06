//
//  HZWebViewViewController.m
//  HZUIKIT
//
//  Created by KB on 2017/11/22.
//  Copyright © 2017年 HZ. All rights reserved.
/*
 iOS: https://github.com/marcuswestin/WebViewJavascriptBridge
 Android：https://github.com/lzyzsd/JsBridge
 */

#import "HZWebViewViewController.h"

@interface HZWebViewViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UITextView* textView;
@end

@implementation HZWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
      http://t200renzheng.zhengtoon.com/open/m/login/goUserLogin?client_id=100100000075&redirect_uri=https://mock.zhongchebaolian.com/bjtdocking/docking.html?c=USERAUTH&response_type=code&scope=user_info&state=
     */
    UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    // 北京通测试环境地址，将此地址整理到统一域名下做管理
    NSURLRequest *loadRequset = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://mock.zhongchebaolian.com/bjjjappweb/appbanner/jinxinxiangzhu.htm"]];
    
    [webView loadRequest:loadRequset];
    webView.delegate = self;
    [self.view addSubview:webView];
 
}

// iOS13是否还支持
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    /*
       (1) 获取当前页面加载URL
       https://mock.zhongchebaolian.com/bjtdocking/docking.html?c=USERAUTH&code=69a95629-b11d-32de-8b7f-bbea965bb514&state=
     */
    NSString  * url = request.URL.absoluteString;
    /*
      根据?拆分字符串为数组
    [ https://mock.zhongchebaolian.com/bjtdocking/docking.html,
     c=USERAUTH&code=69a95629-b11d-32de-8b7f-bbea965bb514&state=]
     */
    NSArray *urlArray = [url componentsSeparatedByString:@"?"];
    if (urlArray.count>2) {
        return YES;
    }
    /*
       获取参数字符串：
       c=USERAUTH&code=69a95629-b11d-32de-8b7f-bbea965bb514&state=
     */
    NSString *params = [urlArray lastObject];
    /*
     根据&拆分字符串为数组
     [
     c=USERAUTH,
     code=69a95629-b11d-32de-8b7f-bbea965bb514,
     state=
     ]
     */
    NSArray* paramArray = [params componentsSeparatedByString:@"&"];
    NSMutableDictionary * paramsDic = [NSMutableDictionary new];
    /*
       将拆分的数组转化为字典
     */
    for (NSString* param in paramArray) {
        NSArray * values = [param componentsSeparatedByString:@"="];
        [paramsDic setObject:[values lastObject] forKey:[values firstObject]];
    }
   // 根据key 获取服务端定义的USERAUTH
    NSString * action = [paramsDic objectForKey:@"c"];
    if ([action isEqualToString:@"USERAUTH"]) {
        // 执行登录操作
        NSString * code = [paramsDic objectForKey:@"code"];
        
        // 调用登录接口login上传 code
        // 接口调用成功后，携带用户数据返回上一个控制器
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
