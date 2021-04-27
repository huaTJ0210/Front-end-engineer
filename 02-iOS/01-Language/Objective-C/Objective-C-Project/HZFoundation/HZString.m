//
//  HZString.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/11.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZString.h"

@implementation HZString
- (void)test{
    
    // (1) C语言中将字符串作为简单的字符数组进行处理；
    
    // (2) 字符串的创建:创建实例的类方法也叫工厂方法，
   // OC运行时生成类的时候，会创建一个类对象：指向超类的指针、类名和指向类方法列表的指针，还有一个long类型，为新创建类实例对象指定大小
    NSString *height = [NSString stringWithFormat:@"Your height is %d feet, %d inches",5,11];
    NSLog(@"%@",height);
    
    // （3）正确的比较字符串
    NSString *thing1 = @"5";
    NSString *thing2 = [NSString stringWithFormat:@"%d",5];
    
    if ([thing1 isEqualToString:thing2]) {
        NSLog(@"the things are the same"); // 内存地址中存储的值进行比较 ： 等价性:即两个字符串是否代表同一个事物
    }
    
    if (thing1 == thing2) {
        NSLog(@"the things are the same"); // 只是比较指针数值【两者是否是同一个对象】，并不是比较指针所指向的内存地址中存储的值；
    }
    
    // （4）字符串的可变性：NSString是不可变的，一旦创建就不能对其进行删除字符或者添加字符来进行改变，只能进行创建副本子串、查找、比较等操作
    
    // （5）可变字符串 NSMutableString
    NSMutableString *muStr = [NSMutableString stringWithCapacity:42];
    [muStr appendString:@"12345"];// 附加新的字符串
    [muStr deleteCharactersInRange:NSMakeRange(0, 2)];// 删除字符串
    NSLog(@"%@",muStr);
}
@end
