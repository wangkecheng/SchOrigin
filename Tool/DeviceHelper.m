//
//  DeviceHelper.m
//  SchOrigin
//
//  Created by WARRON on 8/8/16.
//  Copyright © 2016 smufs. All rights reserved.
//

#import "DeviceHelper.h"

@implementation DeviceHelper

+(CGFloat)versionIphone4:(CGFloat)value4 Iphone5:(CGFloat)value5 Iphone6:(CGFloat)value6 Iphone6p:(CGFloat)value6p{
    NSInteger ScreentHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat value = value5;
    switch (ScreentHeight) {
        case 480:
            value = value4;
            break;
        case 568:
            value = value5;
            break;
        case 667:
            value = value6;
            break;
        case 736:
            value = value6p;
            break;
        default:
            value = value5;
            break;
    }
    return value;
}

@end
