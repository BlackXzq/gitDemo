//
//  UIViewController+Navigator.h
//  TEMPDemo
//
//  Created by nero on 16/12/26.
//  Copyright © 2016年 xuzhanqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Navigator)
// 导航栏顶部视图控制器
- (UIViewController *)topViewController;
// 导航栏底部视图控制器
- (UIViewController *)bottomViewController;

+ (UIViewController *)rootViewControler;

+ (UIViewController *)bottomViewControllerInCurrentScreen;

+ (void)dismissPresentController:(void (^)(void))completion;

- (UIViewController *)navigationPushViewController:(UIViewController *)controller animated:(BOOL)animated;
@end
