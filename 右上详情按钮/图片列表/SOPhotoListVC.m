//
//  SOPhotoListVC.m
//  SchOrigin
//
//  Created by 王帅 on 16/8/14.
//  Copyright © 2016年 王帅. All rights reserved.
//

#import "SOPhotoListVC.h"
#import "SOPagerViewController.h"
@interface SOPhotoListVC ()
@property (nonatomic,strong)SOPagerViewController *SOPTPagerVC;
@end

@implementation SOPhotoListVC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSString *itemVCPath = [[NSBundle mainBundle]pathForResource:@"PhotoPagerPlist" ofType:@"plist"];
    _SOPTPagerVC = [[SOPagerViewController alloc]initWithItemVCPath:itemVCPath];
    [self addChildViewController:_SOPTPagerVC];
    [self.view addSubview:_SOPTPagerVC.view];
}
@end
