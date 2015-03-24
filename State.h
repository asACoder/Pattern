//
//  State.h
//  Pattern
//
//  Created by fushj on 15/3/24.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//
//

#import <Foundation/Foundation.h>

@class Context;

// 抽象操作状态的一组方法
@protocol State <NSObject>

-(void)handle:(Context*)context;

@end


@interface Context: NSObject

@property(nonatomic,strong) id <State> state;
-(instancetype)initWithState:(id <State>)state;

-(void)request;

@end


// 每个状态的行为局部化到自己的类中
@interface ConcreteStateA : NSObject <State>

@end

@interface ConcreteStateB : NSObject <State>

@end
