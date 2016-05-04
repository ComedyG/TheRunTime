//
//  NSString+ExCategory.m
//  TheRunTime
//
//  Created by mac on 16/4/22.
//  Copyright (c) 2016年 mac. All rights reserved.
//

#import "NSString+ExCategory.h"
#import <objc/runtime.h>
@implementation NSString (ExCategory)
char nameKey;

-(void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, &nameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)name
{
    return objc_getAssociatedObject(self, &nameKey);
}

-(void)start111111
{
    self.name=@"妈的还有谁？！还有谁？我就问问？";
    NSLog(@"%@",self.name);
}

@end
