//
//  ViewController.m
//  TheRunTime
//
//  Created by mac on 16/4/22.
//  Copyright (c) 2016年 mac. All rights reserved.
///Users/mac/Desktop/guidang

#import "ViewController.h"
#import <objc/runtime.h>
#import "MyModel.h"
#import "NSString+ExCategory.h"
@interface ViewController ()


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    unsigned int outCount=0;
    
    Ivar *ivars=class_copyIvarList([MyModel class], &outCount);
    for (int i=0; i<outCount; i++) {
        Ivar ivar=ivars[i];
        const char *name=ivar_getName(ivar);
        const char *type=ivar_getTypeEncoding(ivar);
        
        NSLog(@"%s %s",name,type);
    }
    free(ivars);
    MyModel *model=[[MyModel alloc]init];
    model.str=@"123";
    model.arr=@[@"123"];
    
    if([NSKeyedArchiver archiveRootObject:model toFile:@"/Users/mac/Desktop/guidang/person2"])
    {
        NSLog(@"已归档");
        
    }
    
    NSString *str=@"123";
    [str start111111];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        NSLog(@"线程3");
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"返回主线程");
//        });
//    });

    
    dispatch_group_t group=dispatch_group_create();
    dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
   dispatch_group_async(group, queue, ^{
       sleep(2);
       NSLog(@"任务1");
   });
    
    dispatch_group_async(group, queue, ^{
        sleep(5);
        NSLog(@"任务2");
    });
    
    
    dispatch_group_notify(group, queue, ^{
        sleep(1);
        NSLog(@"主任务");
    });
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
