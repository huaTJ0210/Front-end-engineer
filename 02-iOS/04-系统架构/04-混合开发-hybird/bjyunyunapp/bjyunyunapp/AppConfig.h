//
//  AppConfig.h
//  bjyunyunapp
//
//  Created by 华天杰 on 2020/12/16.
//  Copyright © 2020 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,SERVERENV){
    dev,
    prod
};
NS_ASSUME_NONNULL_BEGIN

@interface AppConfig : NSObject
+(instancetype)instance;

/* h5 入口文件的页面地址*/
@property(nonatomic,copy)NSString* baseURL;

-(void)configBaseServerURL:(SERVERENV)env;
@end

NS_ASSUME_NONNULL_END
