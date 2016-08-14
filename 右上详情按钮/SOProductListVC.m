//
//  SOProductListVC.m
//  SchOrigin
//
//  Created by 王帅 on 16/8/14.
//  Copyright © 2016年 王帅. All rights reserved.
//

#import "SOProductListVC.h"
#import "SOPagerViewController.h"
@interface SOProductListVC ()

@property (nonatomic,strong)SOPagerViewController *SOPLPagerVC;
@end

@implementation SOProductListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *itemVCPath = [[NSBundle mainBundle]pathForResource:@"ProductPagerPlist" ofType:@"plist"];
    _SOPLPagerVC = [[SOPagerViewController alloc]initWithItemVCPath:itemVCPath];
    [self addChildViewController:_SOPLPagerVC];
    [self.view addSubview:_SOPLPagerVC.view];
}
@end
