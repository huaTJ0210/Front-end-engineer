//
//  HZFileManager.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/11.
//  Copyright © 2021 HZ. All rights reserved.
//

#import "HZFileManager.h"

@implementation HZFileManager
-(void)test{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *home = [@"~" stringByExpandingTildeInPath];// 将~替换为当前的主目录
    NSDirectoryEnumerator *dirEnumerator = [fileManager enumeratorAtPath:home];
    NSMutableArray *files = [NSMutableArray arrayWithCapacity:17];
    NSString *fileName;
    while (fileName = [dirEnumerator nextObject]) {
        [files addObject:fileName];
    }
    for (NSString* name in files) {
        NSLog(@"%@",name);
    }
}
@end
