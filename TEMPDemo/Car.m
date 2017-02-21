//
//  Car.m
//  TEMPDemo
//
//  Created by nero on 16/12/22.
//  Copyright © 2016年 xuzhanqiang. All rights reserved.
//

#import "Car.h"
#import "Car+Location.h"

@implementation Car

-(id)mutableCopyWithZone:(NSZone *)zone {
    Car *car = [[[self class] allocWithZone:zone] init];
    car.name = self.name;
    car.price = self.price;
    return car;
}

-(id)copyWithZone:(NSZone *)zone {
    Car *car = [[[self class] allocWithZone:zone] init];
    car.name = self.name;
    car.price = self.price;
    return car;
}
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)descripetion {
    
    if ([self location]) {
        NSLog(@"[Car]:[name:%@]:[Price:%@]:[Location:%@]", _name, @(_price), [self location]);
    } else {
        NSLog(@"[Car]:[name:%@]:[Price:%@]", _name, @(_price));
    }
}
@end
