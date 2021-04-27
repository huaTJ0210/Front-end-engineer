//
//  HZMemory.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/11.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZMemory.h"

/*
 内存管理规则：
  (1) 使用 alloc new copy 创建的对象，在不使用的时候需要手动释放，使用其他方法创建的对象
 默认设置了自动释放，则不需要再手动管理，由自动释放池去管理
 
 */

@implementation HZMemory

// (1) setter 方法的内存管理
- (void)setObj:(id)newObj{
    if(obj != newObj){ // 判断是否为同一个对象，如果相同则不需要处理
     /*
      [obj release]; // 如果不进行release，多次赋值则会出现内存泄露的问题，多次赋值旧对象应该release：-1
      obj = [newObj retain];
      */
    }
}

// (2) getter 方法
- (id)obj{
//    return [[obj retain] autorelease];
    return  obj;
}

- (void)dealloc
{
    /*
        [obj release];
     */
}






-(NSInteger)sum:(NSInteger)m startIndex:(NSInteger)start{
    if (m<=start) {
        return start;
    }else{
        return m + [self sum:m-1 startIndex:start];
    }
}
@end
