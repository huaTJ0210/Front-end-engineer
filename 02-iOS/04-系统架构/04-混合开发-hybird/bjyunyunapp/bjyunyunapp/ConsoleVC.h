//
//  ConsoleVC.h
//  bjyunyunapp
//
//  Created by 华天杰 on 2020/12/17.
//  Copyright © 2020 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^DismissBlock)(void);

@interface ConsoleVC : UIViewController
@property(nonatomic,copy)DismissBlock dismissBlock;
@end

NS_ASSUME_NONNULL_END
