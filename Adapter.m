//
//  Adapter.m
//  Pattern
//
//  Created by fushijian on 15/3/20.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import "Adapter.h"

@implementation Adaptee

-(void)specialRequest
{
    NSLog(@"%@:specialRequest",NSStringFromClass([self class]));
}

@end

@implementation Adapter

-(instancetype)initWithAdaptee:(Adaptee*)adaptee
{
    self = [super init];
    if (self) {
        self.adaptee = adaptee;
    }
    return self;
}

-(void)request
{
    [self.adaptee specialRequest];
}

@end
