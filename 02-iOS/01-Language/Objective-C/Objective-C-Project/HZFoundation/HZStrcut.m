//
//  HZStrcut.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/11.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZStrcut.h"

@implementation HZStrcut
/*
   objective-c中使用很多C语言的结构体
 */
- (void)test{
    // (1) NSRange: 结构体类型,表示相关事物的范围
    NSRange  range = NSMakeRange(17, 4);
    NSLog(@"loaction:%lu,length:%lu",(unsigned long)range.location,(unsigned long)range.length);
    // (2)NSPoint、NSSize、NSRect ：这些结构体的创建都有快速的构建方法：NSMakexxx; 在GUI程序中会用到很多这种点、大小、矩形；如果创建为objective-c的对象【创建、销毁、内存】，动态分配增加系统的开销
}
@end
