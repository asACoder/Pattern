//
//  Observer.m
//  Pattern
//
//  Created by fushijian on 15/3/19.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import "Observer.h"

@implementation Observer

-(instancetype)initWithName:(NSString *)name
{
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

-(void)update:(id<Subject>)subject
{
    NSLog(@"观察者%@收到通知:主题的状态改变为:%@",self.name,subject);
}

@end
