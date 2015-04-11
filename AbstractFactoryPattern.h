//
//  AbstractFactoryPattern.h
//  Pattern
//
//  Created by fushj on 15/4/11.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import <Foundation/Foundation.h>

// 抽象产品A

@protocol AbstractProductA <NSObject>

@end

// 具体 Product A

@interface ABSProductAStyleOne : NSObject <AbstractProductA>

@end

@interface ABSProductAStyleTwo : NSObject <AbstractProductA>

@end



// 抽象产品B

@protocol AbstractProductB <NSObject>

@end


// 具体 Product B



@interface ABSProductBStyleOne : NSObject <AbstractProductB>

@end


@interface ABSProductBStyleTwo : NSObject <AbstractProductB>

@end


// 抽象工厂

@protocol AbstractFactoryPattern <NSObject>


-(id <AbstractProductA>)createProductA;
-(id <AbstractProductB>)createProductB;
@end

// 具体工厂A

@interface ConcreteFactoryA : NSObject <AbstractFactoryPattern>

@end

// 具体工厂B

@interface ConcreteFactoryB : NSObject <AbstractFactoryPattern>

@end


