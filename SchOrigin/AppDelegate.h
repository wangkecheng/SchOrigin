//
//  AppDelegate.h
//  SchOrigin
//
//  Created by 王帅 on 16/8/12.
//  Copyright © 2016年 王帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftSlideViewController.h"
#import "BaseTabBarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LeftSlideViewController *leftSlideVC;
@property (strong, nonatomic)BaseTabBarController *baseTabBarVC;

@end

