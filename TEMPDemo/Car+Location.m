//
//  Car+Location.m
//  TEMPDemo
//
//  Created by nero on 16/12/22.
//  Copyright © 2016年 xuzhanqiang. All rights reserved.
//

#import "Car+Location.h"
#import "objc/runtime.h"

NSString * nameKey = @"123124";
@implementation Car (Location)

- (void)setLocation:(NSString *)location {
    // 将某个值跟某个对象关联起来，将某个值存储到某个对象中
    objc_setAssociatedObject(self, &nameKey, location, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)location {
    return objc_getAssociatedObject(self, &nameKey);;
}

@end
