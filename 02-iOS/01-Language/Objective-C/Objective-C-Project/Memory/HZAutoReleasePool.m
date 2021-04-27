//
//  HZAutoReleasePool.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/11.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZAutoReleasePool.h"

@implementation HZAutoReleasePool

-(void)test{
    
}


- (NSString *)description
{
    // (1) desc 变量的内存管理：如果交付于使用方则会在使用上带来不便；但也不能创建完成直接relase
    NSString *desc;
    desc = [NSString stringWithFormat:@"I am %d year old", 4];
    return desc;
    // (2) Cocoa中：自动释放池（autorelease pool）-- NSAutoreleasePool
    // 对象调用autorelease，实际将对象加入到NSAutoreleasePool中，当自动释放池被销毁时，会向该池中所有对象发送releas消息；
    
}

// （3）当在循环体内创建大量的临时对象时，要考虑创建自动释放池来处理
-(void)test1{
    @autoreleasepool {
        for(int i = 0;i<1000000;i++){
//            NSString *desc = @"";
            
        }
    }
    
}
@end
