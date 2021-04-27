//
//  HZMemory.h
//  Objective-C-Project
//
//  Created by 华天杰 on 2021/3/11.
//  Copyright © 2021 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZMemory : NSObject
{
    id obj;
}

-(void)setObj:(id)newObj;
-(id)obj;

-(NSInteger)sum:(NSInteger)m startIndex:(NSInteger)start;
@end

NS_ASSUME_NONNULL_END
