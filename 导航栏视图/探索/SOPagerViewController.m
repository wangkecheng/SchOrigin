//
//  SOPagerViewController.m
//  SchOrigin
//
//  Created by WARRON on 8/8/16.
//  Copyright © 2016 smufs. All rights reserved.
//

#import "SOPagerViewController.h"
#import "StarViewController.h"
#import "AFNetWorkingVC.h"
#import "TYTabPagerController.h"

@interface SOPagerViewController ()<GetPagerCountDelegate>
@property(nonatomic,strong)NSArray *arrPagerVC;
@property(nonatomic,strong)StarViewController *starVC;
@end

@implementation SOPagerViewController

-(id)initWithItemVCPath:(NSString *)itemVCPath{
    if (self  = [super init]) {
      self.arrPagerVC = [FactoryOfClass createClassByPlistPath:itemVCPath];
    }
    return self;
}
-(NSArray *)arrPagerVC{
    if (!_arrPagerVC) {
        _arrPagerVC = [[NSMutableArray alloc]init];
    }
    return _arrPagerVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.adjustStatusBarHeight = YES;
    self.cellSpacing = 8;
    [self setBarStyle:TYPagerBarStyleProgressBounceView];   
    self.pagerCountDelegate = self;
    
}
-(void)setPagerCountDelegate:(id<GetPagerCountDelegate>)pagerCountDelegate{
    [super setPagerCountDelegate:pagerCountDelegate];
}

- (void)setBarStyle:(TYPagerBarStyle)barStyle
{
    [super setBarStyle:barStyle];
    
    switch (barStyle) {
        case TYPagerBarStyleProgressView:
            self.progressWidth = 0;
            self.progressHeight = kUnderLineViewHeight;
            self.progressEdging = 3;
            break;
            
        case TYPagerBarStyleProgressBounceView:
            self.progressHeight = kUnderLineViewHeight;
            self.progressWidth = [UIScreen mainScreen].bounds.size.width/self.arrPagerVC.count;
            break;
        case TYPagerBarStyleCoverView:
            self.progressWidth = 0;
            self.progressHeight = self.contentTopEdging-8;
            self.progressEdging = -self.progressHeight/4;
            break;
        default:
            break;
    }
    
    if (barStyle == TYPagerBarStyleCoverView) {
        self.progressColor = [UIColor lightGrayColor];
    }else {
        self.progressColor = [UIColor redColor];
    }
    self.progressRadius = self.progressHeight/2;
}
- (NSInteger)numberOfControllersInPagerController{
    
    return self.arrPagerVC.count;
}
- (NSString *)pagerController:(TYPagerController *)pagerController titleForIndex:(NSInteger)index{
    return  self.arrPagerVC[index][@"title"];
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index{
    return self.arrPagerVC[index][@"className"];
}
- (void)pagerController:(TYTabPagerController *)pagerController configreCell:(TYTabTitleViewCell *)cell forItemTitle:(NSString *)title atIndexPath:(NSIndexPath *)indexPath{
    
    [super pagerController:pagerController configreCell:cell forItemTitle:title atIndexPath:indexPath];
    // configure cell
}

- (void)pagerController:(TYTabPagerController *)pagerController didSelectAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"didSelectAtIndexPath %@",indexPath);
}

//返回共有多少个pager选项
-(NSInteger)getPagerCount{
    
    return self.arrPagerVC.count;
}
@end
