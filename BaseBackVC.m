//
//  BaseBackVC.m
//  SchOrigin
//
//  Created by WARRON on 7/31/16.
//  Copyright © 2016 smufs. All rights reserved.
//

#import "BaseBackVC.h"

@interface BaseBackVC ()

@end

@implementation BaseBackVC

- (void)viewDidLoad {
    [super viewDidLoad];    
}

-(void)createBackBtn{
    
    UIButton * backBtn = [[UIButton alloc ]initWithFrame:CGRectMake(30, 30, 40, 30)];
    backBtn.titleLabel.text = @"返回";
    
    backBtn.backgroundColor = [UIColor blueColor];
    
    [backBtn setTitleColor:[UIColor  blueColor] forState:UIControlStateNormal] ;
    
    [backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backBtn];
    
}

-(void)backBtnAction:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
}@end
