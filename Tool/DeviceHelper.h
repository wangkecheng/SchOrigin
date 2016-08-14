//
//  DeviceHelper.h
//  SchOrigin
//
//  Created by WARRON on 8/8/16.
//  Copyright © 2016 smufs. All rights reserved.
//

#import <UIKit/UIKit.h>
//UI布局时， 由不同机型确定不同坐标 字体
@interface DeviceHelper : UIView
+(CGFloat)versionIphone4:(CGFloat)value4 Iphone5:(CGFloat)value5 Iphone6:(CGFloat)value6 Iphone6p:(CGFloat)value6p;
@end
