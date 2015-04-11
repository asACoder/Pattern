//
//  FactoryPattern.h
//  Pattern
//
//  Created by fushj on 15/4/10.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum
{
    ProductAStyleOne = 0,
    ProductAStyleTwo,
    ProductBStyleOne,
    ProductBStyleTwo
    
}ProductTypeStyle;

@protocol Product <NSObject>

-(void)operation;

@end


@interface ConcreteProductAStyleOne : NSObject <Product>


@end

@interface ConcreteProductAStyleTwo : NSObject <Product>


@end

@interface ConcreteProductBStyleOne : NSObject <Product>


@end

@interface ConcreteProductBStyleTwo : NSObject <Product>


@end


// 将实例化延迟到子类

@protocol Creator <NSObject>

- (id <Product>)createProductWithTypeStyle:(ProductTypeStyle)typeStyle;

@end

@interface Creator : NSObject <Creator>

-(void)doSomethingWithType:(ProductTypeStyle)typeStyle;

@end

@interface ConcreteCreatorA : Creator

@end

@interface ConcreteCreatorB : Creator
@end
