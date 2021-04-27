//
//  HZDictionary.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/11.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZDictionary.h"

@implementation HZDictionary
-(void)test{
    // (1) 字典的创建及取值
    NSDictionary *numberPairs = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"frist", nil];
    NSString *frist = [numberPairs objectForKey:@"frist"];
    NSLog(@"%@",frist);
    // （2）可变字典
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithCapacity:17];
    [mutableDic setObject:@"2" forKey:@"second"];
    [mutableDic removeObjectForKey:@"frist"];
}
@end
