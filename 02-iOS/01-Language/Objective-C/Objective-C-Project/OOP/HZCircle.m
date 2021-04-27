//
//  HZCircle.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/10.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZCircle.h"

@implementation HZCircle

- (void)setFillColor:(ShapeColor)c{
    fillColor = c; // 区分参数和实例变量
}

- (void)setBounds:(ShapeRect)b{
    bounds = b;
}

- (void)draw{
    NSLog(@"drawing a circle at (%d %d %d %d) ",bounds.x,bounds.y,bounds.width,bounds.height);
}
@end
