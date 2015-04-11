//
//  AbstractFactoryPattern.m
//  Pattern
//
//  Created by fushj on 15/4/11.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import "AbstractFactoryPattern.h"


@implementation ABSProductAStyleOne

@end

@implementation ABSProductAStyleTwo

@end

@implementation ABSProductBStyleOne

@end

@implementation ABSProductBStyleTwo

@end

@implementation ConcreteFactoryA

-(id<AbstractProductA>)createProductA
{
    return [ABSProductAStyleOne new];
}

-(id<AbstractProductB>)createProductB
{
    return [ABSProductBStyleOne new];
}

@end


@implementation ConcreteFactoryB

-(id<AbstractProductA>)createProductA
{
    return [ABSProductAStyleTwo new];
}

-(id<AbstractProductB>)createProductB
{
    return [ABSProductBStyleTwo new];
}

@end
