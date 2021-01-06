//
//  ConsoleVC.m
//  bjyunyunapp
//
//  Created by 华天杰 on 2020/12/17.
//  Copyright © 2020 HZ. All rights reserved.
//

#import "ConsoleVC.h"
#import "AppConfig.h"
@interface ConsoleVC ()
@property (weak, nonatomic) IBOutlet UITextField *webPageTF;

@end

@implementation ConsoleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.webPageTF.text = [AppConfig instance].baseURL;
}

- (IBAction)saveAction:(id)sender {
    if(self.webPageTF.text.length > 0){
        [AppConfig instance].baseURL = self.webPageTF.text;
        [[NSUserDefaults standardUserDefaults] setObject:[AppConfig instance].baseURL forKey:@"firstPageURL"];
    }
}

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.dismissBlock) {
            self.dismissBlock();
        }
    }];
}

@end
