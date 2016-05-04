//
//  MyModel.h
//  TheRunTime
//
//  Created by mac on 16/4/22.
//  Copyright (c) 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject <NSCoding>
@property(nonatomic,copy)NSString *str;
@property(nonatomic,copy)NSArray *arr;

-(void)encodeWithCoder:(NSCoder *)aCoder;

-(instancetype)initWithCoder:(NSCoder *)aDecoder;

@end
