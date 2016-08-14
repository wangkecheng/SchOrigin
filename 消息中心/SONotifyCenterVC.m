//
//  SONotifyCenterVC.m
//  SchOrigin
//
//  Created by 王帅 on 16/8/14.
//  Copyright © 2016年 王帅. All rights reserved.
//

#import "SONotifyCenterVC.h"
#import "SOPagerViewController.h"
@interface SONotifyCenterVC ()
@property (nonatomic,strong)SOPagerViewController *SONTPagerVC;
@end

@implementation SONotifyCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNotifyBtn];
    
    NSString *itemVCPath = [[NSBundle mainBundle]pathForResource:@"notifyCenterPlist" ofType:@"plist"];
    _SONTPagerVC = [[SOPagerViewController alloc]initWithItemVCPath:itemVCPath];
    [self addChildViewController:_SONTPagerVC];
    [self.view addSubview:_SONTPagerVC.view];
}
@end
