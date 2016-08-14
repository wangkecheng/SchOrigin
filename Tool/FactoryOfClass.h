//
//  FactoryOfClass.h
//  SchOrigin
//
//  Created by 王帅 on 16/8/14.
//  Copyright © 2016年 王帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactoryOfClass : UIView
//这个类方法中，需要带创建的视图继承或者间接继承 AFNetWorkingVC,否则报错
+(NSArray *)createClassByPlistPath:(NSString *)itemVCPath;
@end
