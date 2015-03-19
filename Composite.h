//
//  Composite.h
//  ComponentPattern
//
//  Created by fushijian on 15/3/19.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Subject.h"
#import "Observer.h"

@protocol Component <NSObject,Subject>

@property (nonatomic, copy) NSString *name;

@required
- (void)operation;
@optional
- (void)add:(id<Component>)component;
- (void)remove:(id<Component>)component;
- (id<Component>)getChild:(NSUInteger)index;

@end


@interface Composite : NSObject <Component>

@property(nonatomic,copy) NSString *name;
- (id)initWithName:(NSString *)name;

@end


@interface Leaf : NSObject <Component>

@property(nonatomic,copy) NSString *name;
- (id)initWithName:(NSString *)name;

@end
