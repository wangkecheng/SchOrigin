//
//  AFNetWorkingVC.h
//  SchOrigin
//
//  Created by WARRON on 7/30/16.
//  Copyright © 2016 smufs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AFHTTPSessionManager;
#define ScreenWidth  self.view.bounds.size.width
#define ScreenHeight  self.view.bounds.size.height

@interface AFNetWorkingVC : UIViewController

@property (nonatomic,strong)AFHTTPSessionManager *netManager;

-(void)createNotifyBtn;

@end
