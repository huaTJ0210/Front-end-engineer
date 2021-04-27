//
//  HZCar.h
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/11.
//  Copyright © 2021 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HZTire; // @class ： 创建一个向前的引用，循环引用也可以采用@class进行解决；
@class HZEngine;

NS_ASSUME_NONNULL_BEGIN

@interface HZCar : NSObject
{
    HZTire *tires[4];
    HZEngine *engine;
}

- (void)setEngine:(HZEngine *)newEngine;
- (HZEngine*)engine;

- (void)setTire: (HZTire*) tire atIndex:(int)index;
-(HZTire*) trieAtIndex:(int)index;

@end

NS_ASSUME_NONNULL_END
