//
//  AppConfig.m
//  bjyunyunapp
//
//  Created by 华天杰 on 2020/12/16.
//  Copyright © 2020 HZ. All rights reserved.
//

#import "AppConfig.h"



@implementation AppConfig

static AppConfig* config;
+(instancetype)instance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (config == nil) {
            config = [[AppConfig alloc] init];
        }
    });
    return config;
}

-(void)configBaseServerURL:(SERVERENV)env{
    switch (env) {
            case dev:
        {
            self.baseURL = @"http://localhost:3000";
        }
            break;
            case prod:
        {
            self.baseURL = @"";
        }
            break;
            
        default:
            break;
    }
}
@end
