//
//  Adapter.h
//  Pattern
//
//  Created by fushijian on 15/3/20.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Target <NSObject>

-(void)request;

@end



@interface Adaptee : NSObject

-(void)specialRequest;

@end

@interface Adapter : NSObject <Target>

@property (nonatomic,strong) Adaptee *adaptee;
-(instancetype)initWithAdaptee:(Adaptee*)adaptee;

@end
