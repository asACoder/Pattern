//
//  Observer.h
//  Pattern
//
//  Created by fushijian on 15/3/19.
//  Copyright (c) 2015年 fushijian. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol Subject;


@protocol Observer <NSObject>

-(void)update:(id<Subject>)subject;

@end

@interface Observer : NSObject <Observer>

@property(nonatomic,copy) NSString *name;

-(instancetype)initWithName:(NSString*)name;

@end
