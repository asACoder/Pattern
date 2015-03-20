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


void testCompositePattern();
void testObverserPattern();
void testCombineComponentAndObverserPattern();
void testAdapterPattern();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        // 组合模式
        testCompositePattern();
        
        // 观察者模式
//        testObverserPattern();
        
        // 组合模式和观察者模式的组合
        testCombineComponentAndObverserPattern();
        
        // 适配器模式
        testAdapterPattern();
        
    }
    return 0;
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
