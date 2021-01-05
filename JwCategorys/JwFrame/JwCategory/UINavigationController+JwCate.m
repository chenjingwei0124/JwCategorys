//
//  UINavigationController+JwCate.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/29.
//

#import "UINavigationController+JwCate.h"

@implementation UINavigationController (JwCate)
/**
 当前导航控制器
 @return 导航控制器
 */
+ (UINavigationController *)jw_currentNC{
    if (![[UIApplication sharedApplication].windows.lastObject isKindOfClass:[UIWindow class]]) {
        return nil;
    }
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self jw_getCurrentNCFromVC:rootViewController];
}

/** 当前导航控制器 */
+ (UINavigationController *)jw_getCurrentNCFromVC:(UIViewController *)vc{
    //递归
    if ([vc isKindOfClass:[UITabBarController class]]) {
        
        UINavigationController *nc = ((UITabBarController *)vc).selectedViewController;
        return [self jw_getCurrentNCFromVC:nc];
    }else if ([vc isKindOfClass:[UINavigationController class]]) {
        
        if (((UINavigationController *)vc).presentedViewController) {
            return [self jw_getCurrentNCFromVC:((UINavigationController *)vc).presentedViewController];
        }
        return [self jw_getCurrentNCFromVC:((UINavigationController *)vc).topViewController];
    }else if ([vc isKindOfClass:[UIViewController class]]) {
        
        if (vc.presentedViewController) {
            return [self jw_getCurrentNCFromVC:vc.presentedViewController];
        }else {
            return vc.navigationController;
        }
    }else {
        return nil;
    }
}


@end
