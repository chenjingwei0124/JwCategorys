//
//  UIViewController+JwCate.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/29.
//

#import "UIViewController+JwCate.h"

@implementation UIViewController (JwCate)

- (UIViewController *)jw_viewControllerForNavigationControllersWithClassString:(NSString *)classString{
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:NSClassFromString(classString)]) {
            return controller;
        }
    }
    return nil;
}

@end
