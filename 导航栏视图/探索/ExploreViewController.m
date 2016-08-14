//
//  ExploreViewController.m
//  SchOrigin
//
//  Created by WARRON on 7/30/16.
//  Copyright © 2016 smufs. All rights reserved.
//

#import "ExploreViewController.h"
#import "SOPagerViewController.h"

@interface ExploreViewController ()<UISearchBarDelegate>
@property(nonatomic,strong) UISearchBar *searchBar;

@property(nonatomic,strong) UIButton * cancelBtn;

@property(nonatomic,strong)SOPagerViewController *SOPagerVC;

@end

@implementation ExploreViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //创建顶部搜索框
    [self creatTopSearChBar];
    
     NSString *itemVCPath = [[NSBundle mainBundle]pathForResource:@"ExplorePagerPlist" ofType:@"plist"];
     _SOPagerVC =[[SOPagerViewController alloc]initWithItemVCPath:itemVCPath];
    [self addChildViewController:_SOPagerVC];
    [self.view addSubview:_SOPagerVC.view];
}
-(void)viewWillAppear:(BOOL)animated{
    
    [_searchBar becomeFirstResponder];
}
-(void)creatTopSearChBar{
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    
    _searchBar.placeholder=@"搜索";
    
    _searchBar.delegate = self;
    
    _searchBar.showsCancelButton = YES;
   
    _cancelBtn= [self getSearchBarCancelBtn:_searchBar];
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    
    [_cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = _searchBar;
    
    //点击键盘之外的地方收起键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(foldKeyboard:)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

-(void)foldKeyboard:(UITapGestureRecognizer *)tap{
    [self.searchBar resignFirstResponder];
}
-(void)cancelAction:(UIButton *)barBtn{
    
    [self.searchBar resignFirstResponder];
}
-(UIButton *)getSearchBarCancelBtn:(UISearchBar *)searchBar{
    for (UIView *view in [[searchBar.subviews lastObject] subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            return (UIButton *)view;
        }
    }
    return  nil;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
      [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    return  YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
     [_cancelBtn setTitle:@"输入" forState:UIControlStateNormal];
    [searchBar resignFirstResponder];
}
@end
