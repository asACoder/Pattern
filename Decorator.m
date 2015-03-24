//
//  Decorator.m
//  Pattern
//
//  Created by fushj on 15/3/24.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import "Decorator.h"

@implementation ConcreteComponent

-(void)operation
{
    NSLog(@"I am a %@",NSStringFromClass([self class]));
}

@end


@implementation ConcreteDecoratorA

-(instancetype)initWithComponent:(id<ComponentInDecorator>)component
{
    if (self = [super init]) {
        self.component = component;
    }
    return self;
}

-(void)operation
{
    [self.component operation];
    NSLog(@"I am a %@",NSStringFromClass([self class]));
}

@end

@implementation ConcreteDecoratorB

-(instancetype)initWithComponent:(id<ComponentInDecorator>)component
{
    if (self = [super init]) {
        self.component = component;
    }
    return self;
}

-(void)operation
{
    [self.component operation];
    NSLog(@"I am a %@",NSStringFromClass([self class]));
}

@end
