//
//  JwProgressHelper.h
//  JwCategorys
//
//  Created by 陈警卫 on 2018/8/6.
//  Copyright © 2018年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

@interface JwProgressHelper : NSObject

+ (MBProgressHUD *)showProgress;
+ (void)showError:(NSString *)error;
+ (void)showSuccess:(NSString *)success;
+ (void)showWarning:(NSString *)warning;
+ (void)showText:(NSString *)text;

+ (MBProgressHUD *)showProgressInView:(UIView *)view;
+ (void)showText:(NSString *)text inView:(UIView *)view;
+ (void)showError:(NSString *)error inView:(UIView *)view;
+ (void)showSuccess:(NSString *)success inView:(UIView *)view;

+ (void)showCustomView:(NSString *)image text:(NSString *)text inView:(UIView *)view;

@end
