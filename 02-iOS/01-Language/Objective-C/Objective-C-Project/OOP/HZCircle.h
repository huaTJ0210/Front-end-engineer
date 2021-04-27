//
//  HZCircle.h
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/10.
//  Copyright © 2021 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ShapeColor) {
    KGreen,
    KRed
};

typedef NS_ENUM(NSInteger,ShapeType) {
    KCircle,
    KRectangle
};

typedef struct {
    int x, y, width, height;
}ShapeRect;

typedef struct {
    ShapeType type;
    ShapeColor fillColor;
    ShapeRect bounds;
}Shape;



NS_ASSUME_NONNULL_BEGIN

@interface HZCircle : NSObject
{
    // （1）实例变量
    ShapeColor fillColor;
    ShapeRect bounds;
}

- (void)draw;

- (void)setFillColor:(ShapeColor)fillColor;

- (void)setBounds:(ShapeRect)bounds;

@end

NS_ASSUME_NONNULL_END
