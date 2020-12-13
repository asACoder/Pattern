//
//  main.m
//  Pattern
//
//  Created by fushijian on 15/3/19.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Composite.h"
#import "Subject.h"
#import "Observer.h"
#import "Adapter.h"
#import "State.h"
#import "Decorator.h"
#import "FactoryPattern.h"
#import "AbstractFactoryPattern.h"

void testCompositePattern();
void testObverserPattern();
void testCombineComponentAndObverserPattern();
void testAdapterPattern();
void testStatePattern();
void testDecoratorPattern();
void testFactoryPattern();
void testAbstractFactoryPattern();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
//        // 组合模式
//        testCompositePattern();
//        
//        // 观察者模式
//        testObverserPattern();
//        
//        // 组合模式和观察者模式的组合
//        testCombineComponentAndObverserPattern();
//        
//        // 适配器模式
//        testAdapterPattern();
//        
//        // 状态模式
//        testStatePattern();
        
        // 装饰者模式
//        testDecoratorPattern();
        
        
        // 工厂模式
//        testFactoryPattern();
        
        // 抽象工厂方法
        testAbstractFactoryPattern();
    }
    // mark
    return 0;  // return
}

#pragma mark -抽象工厂模式

void testAbstractFactoryPattern()
{
    id <AbstractFactoryPattern> factory = [ConcreteFactoryA new];
    
    id <AbstractProductA> productA = [factory createProductA];
    NSLog(@"%@",productA);
    
    id <AbstractProductB> productB = [factory createProductB];
    NSLog(@"%@",productB);
    
    factory = [ConcreteFactoryB new];
    productA = [factory createProductA];
    NSLog(@"%@",productA);
    
    productB = [factory createProductB];
    NSLog(@"%@",productB);
}


#pragma mark -工厂模式

void testFactoryPattern()
{
    Creator *creator =  [ConcreteCreatorA new];
    id <Product> product = [creator createProductWithTypeStyle:ProductAStyleOne];
    [product operation];
    
    product = [creator createProductWithTypeStyle:ProductAStyleTwo];
    [product operation];
    
    creator = [ConcreteCreatorB new];
//    product = [createor createProductWithTypeStyle:ProductBStyleOne];
//    [product operation];
    [creator doSomethingWithType:ProductBStyleOne];
    [creator doSomethingWithType:ProductBStyleTwo];
}

#pragma mark -装饰者模式

void testDecoratorPattern()
{
    id <ComponentInDecorator> componet = [ConcreteComponent new];
    id <Decorator> concreteDecoratorA = [[ConcreteDecoratorA alloc] initWithComponent:componet];
    id <Decorator> concreteDecoratorB = [[ConcreteDecoratorB alloc] initWithComponent:concreteDecoratorA];
    [concreteDecoratorB operation];
}

#pragma mark -状态模式

void testStatePattern()
{
    Context *context = [[Context alloc] initWithState:[ConcreteStateA new]];
    [context request];
    [context request];
    [context request];
    [context request];
}

#pragma mark -适配器模式

void testAdapterPattern()
{
    id <Target> target = [[Adapter alloc] initWithAdaptee:[Adaptee new]];
    [target request];
}

#pragma mark -组合模式和观察者模式的组合

void testCombineComponentAndObverserPattern()
{
    id <Component> container = [[Composite alloc] initWithName:@"container"];
    id <Component> leaf1 = [[Leaf alloc] initWithName:@"leaf1"];
    
    id <Component> composite = [[Composite alloc] initWithName:@"composite"];
    id <Component> leaf2 = [[Leaf alloc] initWithName:@"leaf2"];
    id <Component> leaf3 = [[Leaf alloc] initWithName:@"leaf3"];
    
    if ([composite respondsToSelector:@selector(add:)]) {
        [composite add:leaf2];
        [composite add:leaf3];
    }
    
    id <Component> leaf4 = [[Leaf alloc] initWithName:@"leaf4"];
    
    if ([container respondsToSelector:@selector(add:)]) {
        [container add:leaf1];
        [container add:composite];
        [container add:leaf4];
    }
    
    id <Observer> observer1 = [[Observer alloc] initWithName:@"first"];
//    id <Observer> observer2 = [[Observer alloc] initWithName:@"second"];
//    id <Observer> observer3 = [[Observer alloc] initWithName:@"third"];
    
    [container addObverser:observer1];
//    [container addObverser:observer2];
//    [container addObverser:observer3];
    
    [container operation];
    
//    [container deleteOberser:observer2];
//    NSLog(@"after delete Observer");
//    [container operation];

}


#pragma mark -观察者模式

void testObverserPattern()
{
    id <Subject> subject = [[Subject alloc] initWithState:@""];
    
    id <Observer> observer1 = [[Observer alloc] initWithName:@"first"];
    id <Observer> observer2 = [[Observer alloc] initWithName:@"second"];
    id <Observer> observer3 = [[Observer alloc] initWithName:@"third"];
    
    [subject addObverser:observer1];
    [subject addObverser:observer2];
    [subject addObverser:observer3];
    
    [((Subject*)subject) setState:@"Hello"];
    
    [subject deleteOberser:observer2];
    
    [((Subject*)subject) setState:@"world"];

}


#pragma mark -组合模式

void testCompositePattern()
{
    id <Component> container = [[Composite alloc] initWithName:@"container"];
    id <Component> leaf1 = [[Leaf alloc] initWithName:@"leaf1"];
    
    id <Component> composite = [[Composite alloc] initWithName:@"composite"];
    id <Component> leaf2 = [[Leaf alloc] initWithName:@"leaf2"];
    id <Component> leaf3 = [[Leaf alloc] initWithName:@"leaf3"];
    
    if ([composite respondsToSelector:@selector(add:)]) {
        [composite add:leaf2];
        [composite add:leaf3];
    }
    
    id <Component> leaf4 = [[Leaf alloc] initWithName:@"leaf4"];
    
    if ([container respondsToSelector:@selector(add:)]) {
        [container add:leaf1];
        [container add:composite];
        [container add:leaf4];
    }
    
    [container operation];
    
    if ([container respondsToSelector:@selector(remove:)]) {
        [container remove:leaf1];
        NSLog(@"after remove:");
        [container operation];
    }
    
    NSLog(@"Get Child");
    id <Component> component = [container getChild:0];
    [component operation];
}
