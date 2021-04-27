//
//  HZCoder.h
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/12.
//  Copyright © 2021 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZCoder : NSObject<NSCoding>

@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger magicNumber;
@property(nonatomic,assign)float shoeSize;
@property(nonatomic,strong)NSMutableArray *subThinges;


-(instancetype)initWithName:(NSString*)n magicNumber:(NSInteger)mn shoeSize:(float)ss;

@end

NS_ASSUME_NONNULL_END
