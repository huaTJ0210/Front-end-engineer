//
//  HZDate.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/12.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZDate.h"

@implementation HZDate

-(void)test{
    NSDate *nowDate = [NSDate date];
    NSLog(@"%@",nowDate);
    
    NSDate *yesterday = [NSDate dateWithTimeIntervalSinceNow:-(24 * 60 * 60)];
    NSLog(@"%@",yesterday);
}

@end
