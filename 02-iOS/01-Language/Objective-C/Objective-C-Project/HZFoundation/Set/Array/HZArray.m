//
//  HZArray.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/11.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZArray.h"

@implementation HZArray
- (void)test{
    // （1）数组的基本创建
    NSArray *array = [NSArray arrayWithObjects:@"one",@"two",@"three", nil];
    NSLog(@"array count:%lu",(unsigned long)[array count]);
    NSLog(@"index 1 :%@",[array objectAtIndex:1]);
    
    
    // （2）可变数组
    NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:17];
    [muArray addObject:@"1"];
    
    // (3) 数组的枚举 : 对可变数组进行枚举，不能同时进行添加或者删除对象
    NSEnumerator *enumerator = [array objectEnumerator];
    id obj;
    while (obj = [enumerator nextObject]) {
        NSLog(@"%@",obj);
    }
}
@end
