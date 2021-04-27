//
//  HZNumber.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/11.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZNumber.h"

@implementation HZNumber
-(void)test{
    // （1）对基本的数值类型进行封装，int float number bool
    NSNumber *num = [NSNumber numberWithInt:42];
    NSLog(@"%@",num);
    
    // （2) 使用NSValue包装一些结构体的值
    
    // （3）NSNull  : 表示什么都没有
    /*
    if(obj == [NSNull null]){
        
    }
     */
}
@end
