//
//  Car.h
//  TEMPDemo
//
//  Created by nero on 16/12/22.
//  Copyright © 2016年 xuzhanqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject<NSMutableCopying, NSCopying>
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, strong) NSString *name;
- (void)descripetion;
@end
