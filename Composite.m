//
//  Composite.m
//  ComponentPattern
//
//  Created by fushijian on 15/3/19.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import "Composite.h"

@interface Composite ()
@property(nonatomic,strong) NSMutableArray *components;
@property(nonatomic,assign) NSInteger level;

@end

@implementation Composite

-(id)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
        self.components = [NSMutableArray array];
    }
    return self;
}

-(void)operation
{
//    NSLog(@"Start Composite name is %@",self.name);
    
    NSEnumerator *iterator = self.components.objectEnumerator;
    id <Component> component = nil;
    while ((component = iterator.nextObject)) {
        [component operation];
    }
//    NSLog(@"end Composite");
    
}

-(void)add:(id<Component>)component
{
    [self.components addObject:component];
}

-(void)remove:(id<Component>)component
{
    [self.components removeObject:component];
}

-(id<Component>)getChild:(NSUInteger)index
{
    if (index > self.components.count) {
        return nil;
    }
    return self.components[index];
}


/*先组合 后添加观察者*/
/*将观察者模式 和 组合模式 相结合*/

-(void)addObverser:(id<Observer>)observer
{
    NSEnumerator *iterator = self.components.objectEnumerator;
    id <Component> component = nil;
    while ((component = iterator.nextObject)) {
        if ([component isKindOfClass:[Leaf class]]) {
            [(Leaf*)component addObverser:observer];
        }else{
            [component addObverser:observer];
        }
    }
}

-(void)deleteOberser:(id<Observer>)observer
{
    NSEnumerator *iterator = self.components.objectEnumerator;
    id <Component> component = nil;
    while ((component = iterator.nextObject)) {
        if ([component isKindOfClass:[Leaf class]]) {
            [(Leaf*)component deleteOberser:observer];
        }else{
            [component deleteOberser:observer];
        }
    }
}

-(void)notifyObersers
{
    NSEnumerator *iterator = self.components.objectEnumerator;
    id <Component> component = nil;
    while ((component = iterator.nextObject)) {
        if ([component isKindOfClass:[Leaf class]]) {
            [(Leaf*)component notifyObersers];
        }
    }

}

@end



@interface Leaf()
@property(nonatomic,strong) NSMutableArray *obversers;

@end

@implementation Leaf

-(id)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
        self.obversers = [NSMutableArray array];
    }
    return self;
}

-(void)operation
{
//    NSLog(@"Leaf name is %@",self.name);
    [self notifyObersers];
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
    for (id <Observer>observer in self.obversers) {
        
        [observer update:self];
    }
}

-(NSString *)description
{
    return _name;
}


@end