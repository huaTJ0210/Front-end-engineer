//
//  HZRetainTracker.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/11.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZRetainTracker.h"

@implementation HZRetainTracker
- (instancetype)init
{
    self = [super init];
    if (self) {
        // （1）new、alloc、copy创建对象，会使得引用计数+1
        // (2) retain:消息引用计数+1； release消息引用计数-1；
    //        NSLog(@"init:Retain count of %d:",[self retainCount]);
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"对象销毁时调用！！！");
}
@end
