//
//  Decorator.h
//  Pattern
//
//  Created by fushj on 15/3/24.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//
//  理解中的重点是装饰者与被装饰者有相同的接口
//  对扩展开发，对修改封闭

#import <Foundation/Foundation.h>

@protocol ComponentInDecorator <NSObject>

-(void)operation;

@end

@protocol Decorator <NSObject,ComponentInDecorator>


@end

@interface ConcreteComponent : NSObject <ComponentInDecorator>

@end

@interface ConcreteDecoratorA : NSObject <Decorator>

@property(nonatomic,strong) id <ComponentInDecorator> component;

-(instancetype)initWithComponent:(id<ComponentInDecorator>)component;

@end

@interface ConcreteDecoratorB : NSObject <Decorator>

@property(nonatomic,strong) id <ComponentInDecorator> component;

-(instancetype)initWithComponent:(id<ComponentInDecorator>)component;

@end
