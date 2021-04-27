//
//  HZData.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/12.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZData.h"

@implementation HZData
-(void)test{
    // data将保存一个普通C字符串（一个字节数列）
    const char *string = "Hi there , this is a C string";
    NSData *data = [NSData dataWithBytes:string length:strlen(string) + 1];
    NSLog(@"%@",data);
}
@end
