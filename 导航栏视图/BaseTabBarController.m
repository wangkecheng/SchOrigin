//
//  BaseTabBarController.m
//  SchOrigin
//
//  Created by WARRON on 7/30/16.
//  Copyright © 2016 smufs. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNaviItemVC.h"
#import "GalaxyViewController.h"
#import "ExploreViewController.h"
#import "FriendCircleViewContro.h"
@interface BaseTabBarController ()
@property (nonatomic,strong)UISwipeGestureRecognizer *swipeRight;
@end
CGPoint pointStart;
CGPoint pointEnd;
@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatNavigationItemVC];    
}

-(void)creatNavigationItemVC{
    
    NSString *itemVCPath =  [[NSBundle mainBundle]pathForResource:@"NaviItemController" ofType:@"plist"];
    
    NSArray *itemVCArr = [NSArray  arrayWithContentsOfFile:itemVCPath];
    
    NSMutableArray *itemArr = [[NSMutableArray alloc]init];
    
    [itemVCArr enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *  stop) {
        NSString *title = dict[@"title"];
        NSString *imageNormal = dict[@"imageNormal"];
        NSString *imagePress =dict[@"imagePress"];
        NSString *className = dict[@"className"];
        Class controllerClass = NSClassFromString(className);
        
        BaseNaviItemVC *itemVC =  [[controllerClass alloc ]init];
        
        itemVC.title = title;
        
        UIImage *image = [[UIImage imageNamed:imageNormal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *imageSelect = [[UIImage imageNamed:imagePress] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UINavigationController *navi =  [[UINavigationController alloc ]initWithRootViewController:itemVC];
        
        navi.navigationBar.translucent  = NO;
        
        navi.tabBarItem  = [[UITabBarItem alloc]initWithTitle:title image:image selectedImage:imageSelect];
        navi.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        
        [itemArr addObject:navi];
        
    }];
    
    self.tabBarController.tabBar.translucent  = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.viewControllers  = itemArr;
}

@end



