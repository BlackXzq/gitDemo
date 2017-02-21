//
//  UIViewController+Navigator.m
//  TEMPDemo
//
//  Created by nero on 16/12/26.
//  Copyright © 2016年 xuzhanqiang. All rights reserved.
//

#import "UIViewController+Navigator.h"

@implementation UIViewController (Navigator)

- (UIViewController *)topViewController
{
    return self.navigationController.topViewController;
}

- (UIViewController *)bottomViewController
{
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (viewControllers.count > 0) {
        return viewControllers.firstObject;
    }
    return nil;
}

+ (UIViewController *)rootViewControler
{
    UIViewController* controller = nil;
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    if (!window || window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                break;
            }
        }
    }
    
    
    if (window) {
        NSArray* subViews = [window subviews];
        if (subViews && [subViews count] > 0) {
            UIView* rootView = [[window subviews] objectAtIndex:0];
            id nextResponder = [rootView nextResponder];
            if ([nextResponder isKindOfClass:[UIWindow class]]) {
                controller = ((UIWindow*)nextResponder).rootViewController;
            } else if ([nextResponder isKindOfClass:[UIViewController class]]) {
                controller = nextResponder;
            }
        }
        
        if (!controller && [window respondsToSelector:@selector(rootViewController)]) {
            controller = window.rootViewController;
        }
    }
    
    while (controller.presentedViewController) {
        controller = controller.presentedViewController;
    }
    
    return controller;
}

+ (void)dismissPresentController:(void (^)(void))completion
{
    UIViewController *rootController = [UIViewController rootViewControler];
    if (rootController && rootController.modalPresentationStyle == UIModalPresentationFormSheet) {
        NSString *presentingViewControllerClassName = NSStringFromClass([rootController class]);
        if ([presentingViewControllerClassName isEqualToString:@"MLNavigationController"]) {
            [rootController dismissViewControllerAnimated:YES completion:^{
                if (completion) {
                    completion();
                }
            }];
            return;
        }
    }
    if (completion) {
        completion();
    }
}

+ (UIViewController *)bottomViewControllerForController:(UIViewController *)controller {
    if ([controller isKindOfClass:[UINavigationController class]]) {
        return [UIViewController viewControllerInNavigation:(UINavigationController *)controller];
    } else if ([controller isKindOfClass:[UITabBarController class]]) {
        return [self viewControllerInTab:(UITabBarController *)controller];
    } else if ([controller isKindOfClass:[UIViewController class]]) {
        return controller;
    }
    
    return nil;
}

+ (UIViewController *)viewControllerInTab:(UITabBarController *)tabBarController {
    if (!tabBarController) {
        return nil;
    }
    
    UIViewController *currentController = nil;
    if (tabBarController.selectedIndex < [tabBarController.childViewControllers count]) {
        currentController = [tabBarController.childViewControllers objectAtIndex:tabBarController.selectedIndex];
    }
    
    return [UIViewController bottomViewControllerForController:currentController];
}

+ (UIViewController *)viewControllerInNavigation:(UINavigationController *)navigationController {
    if (!navigationController) {
        return nil;
    }
    
    UIViewController *topController = navigationController.topViewController;
    return [UIViewController bottomViewControllerForController:topController];
}

+ (UIViewController *)bottomViewControllerInCurrentScreen {
    UIViewController *rootViewController = [UIViewController rootViewControler];
    return [UIViewController bottomViewControllerForController:rootViewController];
}

- (UIViewController *)navigationPushViewController:(UIViewController *)controller animated:(BOOL)animated
{
    if (!self.navigationController)
    {
        return controller;
    }
    
    [controller setHidesBottomBarWhenPushed:YES];
    
    UINavigationController *navigationController = self.navigationController;
    [navigationController pushViewController:controller animated:animated];
    return controller;
}
@end
