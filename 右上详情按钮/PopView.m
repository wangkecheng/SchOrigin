//
//  PopView.m
//  SchOrigin
//
//  Created by WARRON on 7/31/16.
//  Copyright © 2016 smufs. All rights reserved.
//

#import "PopView.h"
#import "PopViewBaseBackVC.h"
#import "SONotifyCenterVC.h"
#import "AFNetWorkingVC.h"
#define Tag 100


@implementation PopView

-(NSMutableArray *)itemVCArr{
    if (!_itemVCArr) {
        _itemVCArr = [[NSMutableArray alloc]init];
    }
    return  _itemVCArr;
}
-(NSMutableArray *)itemNameArr{
    if (!_itemNameArr) {
        _itemNameArr = [[NSMutableArray alloc]init];
    }
    return  _itemNameArr;
}
-(NSMutableArray *)btnArr{
    if (!_btnArr) {
        _btnArr = [[NSMutableArray alloc]init];
    }
    return  _btnArr;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        [self prepareItemVCInfo];
    }
    return  self;
}
-(void)prepareItemVCInfo{
    //创建选项中对应的视图数据
    NSString *itemVCPath = [[NSBundle mainBundle]pathForResource:@"PopViewVCPlist" ofType:@"plist"];
    NSArray * array = [[NSArray alloc]initWithContentsOfFile:itemVCPath];
    [array enumerateObjectsUsingBlock:^(NSDictionary  *dict, NSUInteger idx, BOOL *  stop) {
        
        Class classControl = NSClassFromString(dict[@"className"]);
       
         AFNetWorkingVC *baseItemVC = [[classControl alloc]init];
        
        [self.itemNameArr addObject: dict[@"title"]];
        
        baseItemVC.title = dict[@"title"];
        
        [self.itemVCArr addObject:baseItemVC];
        
    }];
}

-(void)createItemVCBtn{
    CGFloat width = self.frame.size.width;
    CGFloat heigh = self.frame.size.height;
   
    CGFloat itemHeight = heigh/self.itemVCArr.count;
    
    if (self.btnArr.count == 0)
         //第二次进来就不创建button了
    for (int i = 0; i < self.itemVCArr.count; i++) {
        UIButton *itemBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, itemHeight * i, width, itemHeight)];
        
        [itemBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [itemBtn setTitle:self.itemNameArr[i] forState:UIControlStateNormal];
        
        itemBtn.tag = i + Tag;
        
        [self.btnArr addObject:itemBtn];
        
        [self addSubview:itemBtn];
    }
}
-(void)btnAction:(UIButton *)btn{
    
    AFNetWorkingVC * baseVC = [self.itemVCArr objectAtIndex:btn.tag - Tag];
//    switch (btn.tag - Tag) {
//        case 0:
//            baseVC = [self.itemVCArr objectAtIndex:btn.tag - Tag];
//            break;
//        case 1:
//            baseVC = [self.itemVCArr objectAtIndex:btn.tag - Tag];
//            break;
//        case 2:
//            baseVC = [self.itemVCArr objectAtIndex:btn.tag - Tag];
//            break;
//        case 3:
//            baseVC = [self.itemVCArr objectAtIndex:btn.tag - Tag];
//            break;
//        case 4:
//            baseVC = [self.itemVCArr objectAtIndex:btn.tag - Tag];
//            break;
//        default:
//            break;
//    }
    
    //让主界面来弹出界面，定义一个协议
    if(_delegate != nil && [_delegate respondsToSelector:@selector(pushRigthTopItemVC:)]){
        [_delegate  pushRigthTopItemVC:baseVC];
    }

     [UIView animateWithDuration:.5 animations:^{
          self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 20, 0,0);
     } completion:^(BOOL finished) {
      }];
}
@end
