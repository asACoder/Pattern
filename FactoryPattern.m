//
//  FactoryPattern.m
//  Pattern
//
//  Created by fushj on 15/4/10.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import "FactoryPattern.h"

// Product A
@implementation ConcreteProductAStyleOne

-(void)operation
{
    NSLog(@"i am %@",NSStringFromClass([self class]));
}

@end

@implementation ConcreteProductAStyleTwo

-(void)operation
{
    NSLog(@"i am %@",NSStringFromClass([self class]));
}

@end

// Product B

@implementation ConcreteProductBStyleOne

-(void)operation
{
    NSLog(@"i am %@",NSStringFromClass([self class]));
}

@end

@implementation ConcreteProductBStyleTwo

-(void)operation
{
    NSLog(@"i am %@",NSStringFromClass([self class]));
}

@end


// Creator

@implementation Creator

// 将实例化延迟到子类
-(void)doSomethingWithType:(ProductTypeStyle)typeStyle
{
    id <Product> product = nil;
    product = [self createProductWithTypeStyle:typeStyle];
    [product operation];
}


-(id<Product>)createProductWithTypeStyle:(ProductTypeStyle)typeStyle
{
    [NSException raise:@"不能实例化" format:@"%@是抽象类", NSStringFromClass([self class])];
    return nil;
}


@end

@implementation ConcreteCreatorA

-(id<Product>)createProductWithTypeStyle:(ProductTypeStyle)typeStyle
{
    if (typeStyle == ProductAStyleOne) {
        return [ConcreteProductAStyleOne new];
    }else if (typeStyle == ProductAStyleTwo){
        return [ConcreteProductAStyleTwo new];
    }
    return nil;
}

@end

@implementation ConcreteCreatorB

-(id<Product>)createProductWithTypeStyle:(ProductTypeStyle)typeStyle
{
    if (typeStyle == ProductBStyleOne) {
        return [ConcreteProductBStyleOne new];
    }else if (typeStyle == ProductBStyleTwo){
        return [ConcreteProductBStyleTwo new];
    }
    return nil;
}

@end
