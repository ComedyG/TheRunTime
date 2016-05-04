//
//  MyModel.m
//  TheRunTime
//
//  Created by mac on 16/4/22.
//  Copyright (c) 2016年 mac. All rights reserved.
//

#import "MyModel.h"
#import <objc/runtime.h>
@implementation MyModel

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int outCount=0;
    Ivar *ivars=class_copyIvarList([self class], &outCount);
    for (int i=0; i<outCount; i++) {
        Ivar ivar=ivars[i];
        const char *ivarName=ivar_getName(ivar);
        NSString *name=[NSString stringWithUTF8String:ivarName];
        id value=[self valueForKey:name];
        [aCoder encodeObject:value forKey:name];
        
    }

    free(ivars);
}



-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    [aDecoder decodeObjectForKey:@"_str"];
    [aDecoder decodeObjectForKey:@"_arr"];
    
    return self;
}

@end
