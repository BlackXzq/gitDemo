//
//  Car+Location.h
//  TEMPDemo
//
//  Created by nero on 16/12/22.
//  Copyright © 2016年 xuzhanqiang. All rights reserved.
//

#import "Car.h"

@interface Car (Location)
- (void)setLocation:(NSString *)location;
- (NSString *)location;
@end
