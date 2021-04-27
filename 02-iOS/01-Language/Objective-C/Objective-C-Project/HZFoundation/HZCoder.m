//
//  HZCoder.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/12.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZCoder.h"

/*
   （1）基本类型NSString、NSArray、NSDictionary等支持直接写入本地文件，或者序列化成NSData后写入文件进行保存；
 */

@implementation HZCoder

- (instancetype)initWithName:(NSString *)n magicNumber:(NSInteger)mn shoeSize:(float)ss{
    if (self = [super init]) {
        self.name = n;
        self.magicNumber = mn;
        self.shoeSize = ss;
        self.subThinges = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super init]) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.magicNumber = [coder decodeIntegerForKey:@"magicNumber"];
        self.shoeSize = [coder decodeFloatForKey:@"shoeSize"];
        self.subThinges = [coder decodeObjectForKey:@"subThings"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name forKey:@"name"];
    [coder  encodeInteger:self.magicNumber forKey:@"magicNumber"];
    [coder encodeFloat:self.shoeSize forKey:@"shoeSize"];
    [coder encodeObject:self.subThinges forKey:@"subThings"];
}


-(void)test{
    HZCoder *obj = [[HZCoder alloc] initWithName:@"lisi" magicNumber:10 shoeSize:42.5];
    // （1）对自定义对象进行序列化
    NSData *objData = [NSKeyedArchiver archivedDataWithRootObject:obj];
    // (2) 对自定义对象进行反序列化
    HZCoder *anotherObj = [NSKeyedUnarchiver unarchiveObjectWithData:objData];
    NSLog(@"%@",anotherObj);
}

@end
