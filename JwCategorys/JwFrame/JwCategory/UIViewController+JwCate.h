//
//  UIViewController+JwCate.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JwCate)

- (UIViewController *)jw_viewControllerForNavigationControllersWithClassString:(NSString *)classString;

@end

NS_ASSUME_NONNULL_END
