//
//  UIViewController+mtt_category.m
//  IronMan_Example
//
//  Created by 刘浩 on 2018/11/20.
//  Copyright © 2018 MTTGCC. All rights reserved.
//

#import "UIViewController+mtt_category.h"

@implementation UIViewController (mtt_category)


+ (UIViewController *)mtt_TopviewControler {
    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    UIViewController *parent = rootVC;
    while ((parent = rootVC.presentedViewController) != nil )
    {
        rootVC = parent;
    }
    
    if([rootVC isKindOfClass:[UITabBarController class]])
    {
        UITabBarController  *tabBarVC = (UITabBarController *)rootVC;
        rootVC = tabBarVC.selectedViewController;
    }
    
    while ([rootVC isKindOfClass:[UINavigationController class]])
    {
        rootVC = [(UINavigationController *)rootVC topViewController];
    }
    return rootVC;
}

@end
