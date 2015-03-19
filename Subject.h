//
//  Subject.h
//  Pattern
//
//  Created by fushijian on 15/3/19.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Observer;

@protocol Subject <NSObject>

@required
-(void)addObverser:(id<Observer>)observer;
-(void)deleteOberser:(id<Observer>)observer;
-(void)notifyObersers;

@end

@interface Subject : NSObject <Subject>

@property(nonatomic,copy) NSString *state;
-(instancetype)initWithState:(NSString*)state;

@end

