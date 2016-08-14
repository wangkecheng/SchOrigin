//
//  FactoryOfClass.m
//  SchOrigin
//
//  Created by 王帅 on 16/8/14.
//  Copyright © 2016年 王帅. All rights reserved.
//

#import "FactoryOfClass.h"
#import "AFNetWorkingVC.h"
@implementation FactoryOfClass
+(NSArray *)createClassByPlistPath:(NSString *)itemVCPath{
    NSArray * array = [[NSArray alloc]initWithContentsOfFile:itemVCPath];
    NSMutableArray * arrItemVC = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(NSDictionary  *dict, NSUInteger idx, BOOL *  stop) {
        //每一个视图有类名，标题， 将其放在字典中
        NSMutableDictionary * dictItem = [NSMutableDictionary dictionary];
        
        NSString *className = dict[@"className"];
        Class classControl = NSClassFromString(className);
        AFNetWorkingVC *basePagerVC = [[classControl alloc]init];
        //将视图放在字典中
        [dictItem setObject:basePagerVC forKey:@"className"];
        
        //将标题放在字典中
        [dictItem setObject:dict[@"title"] forKey:@"title"];        
        [arrItemVC addObject:dictItem];
    }];
    return  [arrItemVC copy];
}

@end
