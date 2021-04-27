//
//  HZCar.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/11.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZCar.h"
#import "HZEngine.h"
#import "HZTire.h"

@implementation HZCar

// 初始化方法： 在某些情况下，init方法的自定义实现可能返回一个替代对象。因此，在后续代码中，必须始终使用init返回的对象，而不是alloc或allocWithZone:返回的对象。
- (instancetype)init
{
    self = [super init]; //
    if (self) {
        
    }
    return self;
}


- (void)setEngine:(HZEngine *)newEngine{
    engine = newEngine;
}
- (HZEngine *)engine{
    return engine;
}

- (void)setTire:(HZTire *)tire atIndex:(int)index{
    if (index < 0 || index > 3) {
        NSLog(@"index is error!!!");
        return;
    }
    tires[index] = tire;
}

- (HZTire *)trieAtIndex:(int)index{
    if (index < 0 || index > 3) {
        NSLog(@"index is error");
        return nil;
    }
    return tires[index];
}

-(void)test{
    // (1) 初始化对象 : 初始化方法（init）返回的对象可能与分配的对象不同；【类簇：init方法可以传递参数，根据参数的不同会返回合适的类的对象】
    HZCar *car = [[HZCar alloc] init];
    NSLog(@"%@",car);
    // (2) 分步初始化对象
    HZCar * car1 = [HZCar alloc];
    car1 =  [car1 init];
}
@end
