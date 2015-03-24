//
//  State.m
//  Pattern
//
//  Created by fushj on 15/3/24.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import "State.h"



@implementation Context

-(instancetype)initWithState:(id<State>)state
{
    if (self = [super init]) {
        self.state = state;
    }
    return self;
}

-(void)request
{
    [self.state handle:self];
}

@end


@implementation ConcreteStateA

-(void)handle:(Context *)context
{
    NSLog(@"ConcreteStateA");
    context.state = [ConcreteStateB new];
}

@end


@implementation ConcreteStateB

-(void)handle:(Context *)context
{
    NSLog(@"ConcreteStateB");
    context.state = [ConcreteStateA new];
}

@end

