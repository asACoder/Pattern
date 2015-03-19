//
//  Subject.m
//  Pattern
//
//  Created by fushijian on 15/3/19.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import "Subject.h"
#import "Observer.h"
@interface Subject()
@property(nonatomic,strong) NSMutableArray *obversers;
@end

@implementation Subject

-(instancetype)initWithState:(NSString *)state
{
    self = [super init];
    if (self) {
        self.obversers = [NSMutableArray array];
    }
    return self;
    
}

-(void)addObverser:(id<Observer>)observer
{
    [self.obversers addObject:observer];
}

-(void)deleteOberser:(id<Observer>)observer
{
    [self.obversers removeObject:observer];
}

-(void)notifyObersers
{
    for (id <Observer> observer in self.obversers) {
        [observer update:self];
    }
}


-(void)setState:(NSString *)state
{
    if (![_state isEqualToString:state]) {
        _state = [state copy];
        [self notifyObersers];
    }
}


-(NSString *)description
{
    return _state;
}
@end


