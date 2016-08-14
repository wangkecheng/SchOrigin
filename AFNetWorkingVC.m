//
//  AFNetWorkingVC.m
//  SchOrigin
//
//  Created by WARRON on 7/30/16.
//  Copyright © 2016 smufs. All rights reserved.

#import "AFNetWorkingVC.h"
#import <AFNetworking.h>
#import "SONotifyCenterVC.h"

@interface AFNetWorkingVC ()
@end

@implementation AFNetWorkingVC

- (void)viewDidLoad {
    
    [super viewDidLoad];   
    
    [self createNotifyBtn];
}
-(void)createNotifyBtn{
    
    UIButton *notifyBtn = [[UIButton alloc ]initWithFrame:CGRectMake(ScreenWidth - 80, ScreenHeight - 180, 40, 40)];
    
    [notifyBtn setTitle:@"消息中心" forState:UIControlStateNormal];
    
    notifyBtn .backgroundColor = [UIColor blackColor];
    
    [notifyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [notifyBtn addTarget:self action:@selector(notifyBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:notifyBtn];
}

-(void)notifyBtnAction:(UIButton*)btn{
    
    SONotifyCenterVC * notifyVC = [[SONotifyCenterVC alloc ]init];
    
    [notifyVC setTitle:@"消息中心"];
    
    [self.navigationController pushViewController:notifyVC animated:YES];
}
-(AFHTTPSessionManager *)netManager{
    if (!_netManager) {
       
    _netManager  =[AFHTTPSessionManager manager];
        //设置JSON数据序列化，将JSON数据转换为字典或者数组
    _netManager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        //在序列化起中追加一个类型， text/html这个类型是不支持的，text/json，application/json
    _netManager.responseSerializer.acceptableContentTypes = [_netManager.responseSerializer.acceptableContentTypes  setByAddingObject:@"text/html"];
    }
    return _netManager;
}
@end
