//
//  BaseNaviItemVC.m
//  SchOrigin
//
//  Created by WARRON on 7/30/16.
//  Copyright © 2016 smufs. All rights reserved.
//

#import "BaseNaviItemVC.h"
#import "AppDelegate.h"
#import "PopView.h"
@interface BaseNaviItemVC ()<PushRigthTopItemDelegate>
@property (nonatomic,strong)PopView *popView;
@end

@implementation BaseNaviItemVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)creatView{
    
    //设置顶部
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    leftBtn.frame =  CGRectMake(0, 0, 30, 30);
    
    [leftBtn setImage:[UIImage imageNamed:@"menu@2x"] forState:UIControlStateNormal];
    
    leftBtn.backgroundColor = [UIColor redColor];
    
    [leftBtn addTarget:self action:@selector(leftBarBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *leftBarLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 0, 30, 30)];
    
    leftBarLabel.text = @"校源";
    leftBarLabel.font = [UIFont systemFontOfSize:12];
    
    UIView *leftContainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 85, 30)];
    
    [leftContainView addSubview:leftBtn];
    
    [leftContainView addSubview:leftBarLabel];

       UIBarButtonItem * leftBarItem  = [[UIBarButtonItem alloc]initWithCustomView:leftContainView];
    
    [self setBarButton:leftBarItem isLeft:YES ];
    
    UIButton *rigthBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    
    rigthBtn.backgroundColor = [UIColor redColor];
    
    [rigthBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    [rigthBtn addTarget:self action:@selector(rightBarBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * rightBarItem = [[UIBarButtonItem alloc]initWithCustomView:rigthBtn];
    [self setBarButton:rightBarItem isLeft:NO];
    
    //点击弹出框外区域收起键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(foldKeyboard:)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

-(void)foldKeyboard:(UITapGestureRecognizer *)tap{
    [self foldPopView];
}

-(PopView *)popView{
    if (!_popView) {
        _popView = [[PopView alloc ]initWithFrame:CGRectMake(ScreenWidth - 20, 20, 0,0)];
        _popView.delegate  = self;
        [self.view addSubview:_popView];
    }
    return  _popView;
}
//点击右上按钮弹出侧图
-(void)rightBarBtnAction:(UIButton *)btn{    
    static short count = 0;
    if (count%2==0) {
        //点击次数为
    CGRect frame =CGRectMake(ScreenWidth - ScreenWidth / 3 - 10 , 10, ScreenWidth / 3, ScreenHeight/3 * 2);
    [UIView animateWithDuration:.5 animations:^{
        self.popView.frame = frame;
    }];
      [_popView createItemVCBtn];
   }
    else{
        [self foldPopView];
    }
    if(count++ == 1){
        count = 0;
    }
}

-(void)foldPopView{
[UIView animateWithDuration:.5 animations:^{
    self.popView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 20, 0,0);;
    }];
}

//点击左上按钮弹出侧图
-(void)leftBarBtnAction:(UIButton *)btn{
    
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.leftSlideVC.closed){
        
        [tempAppDelegate.leftSlideVC openLeftView];
    }
    else   {
        [tempAppDelegate.leftSlideVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [tempAppDelegate.leftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [tempAppDelegate.leftSlideVC setPanEnabled:YES];
}

-(void)setBarButton:(UIBarButtonItem *)item isLeft:(BOOL)isLeft{
    if (isLeft)
        [self.navigationItem setLeftBarButtonItem:item animated:YES];
    else
        [self.navigationItem setRightBarButtonItem:item animated:YES];
}
-(void)pushRigthTopItemVC:(PopViewBaseBackVC *)popVC{
    [self.navigationController pushViewController:popVC animated:YES];
}
@end
