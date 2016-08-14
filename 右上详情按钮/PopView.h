//
//  PopView.h
//  SchOrigin
//
//  Created by WARRON on 7/31/16.
//  Copyright © 2016 smufs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PopViewBaseBackVC.h"
@protocol PushRigthTopItemDelegate <NSObject>
//这个PopViewBaseBackVC是弹出框选择选项后视图的公共VC
-(void)pushRigthTopItemVC:(PopViewBaseBackVC *)popVC;
@end
@interface PopView : UIView

-(instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic,strong)NSMutableArray *itemVCArr;

@property (nonatomic,strong)NSMutableArray *itemNameArr;

@property (nonatomic,strong)NSMutableArray *btnArr;

@property (nonatomic,assign)CGRect newFrame;

-(void)createItemVCBtn;

@property (nonatomic,weak)id<PushRigthTopItemDelegate>delegate;

@end
