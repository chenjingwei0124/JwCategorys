//
//  UINavigationController+JwCate.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (JwCate)

/** 当前导航控制器 */
+ (UINavigationController *)jw_currentNC;

/** 当前导航控制器 */
+ (UINavigationController *)jw_getCurrentNCFromVC:(UIViewController *)vc;


@end

NS_ASSUME_NONNULL_END
