//
//  JwProgressHelper.m
//  JwCategorys
//
//  Created by 陈警卫 on 2018/8/6.
//  Copyright © 2018年 陈警卫. All rights reserved.
//

#import "JwProgressHelper.h"
#import "UIImage+JwCate.h"

#define kJwShowDuration 2.0

@interface JwProgressHelper ()

@end

@implementation JwProgressHelper

+ (MBProgressHUD *)showProgress{
    UIView *view = [UIApplication sharedApplication].keyWindow;
    return [self showProgressInView:view];
}

+ (void)showError:(NSString *)error{
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [self showError:error inView:view];
}

+ (void)showSuccess:(NSString *)success{
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [self showSuccess:success inView:view];
}

+ (void)showWarning:(NSString *)warning{
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [self showWarning:warning inView:view];
}

+ (void)showText:(NSString *)text{
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [self showText:text inView:view];
}


+ (MBProgressHUD *)showProgressInView:(UIView *)view{
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.bezelView.backgroundColor = [UIColor blackColor];
    HUD.contentColor = [UIColor blackColor];
    HUD.removeFromSuperViewOnHide = YES;
    [view addSubview:HUD];
    [HUD showAnimated:YES];
    return HUD;
}

+ (void)showError:(NSString *)error inView:(UIView *)view {
    [self showCustomView:@"hub_failure" text:error inView:view];
}

+ (void)showSuccess:(NSString *)success inView:(UIView *)view {
    [self showCustomView:@"hub_success" text:success inView:view];
}

+ (void)showWarning:(NSString *)warning inView:(UIView *)view{
    [self showCustomView:@"hub_warning" text:warning inView:view];
}

+ (void)showText:(NSString *)text inView:(UIView *)view{
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = MBProgressHUDModeText;
    HUD.detailsLabel.font = [UIFont systemFontOfSize:15];
    HUD.detailsLabel.text = text;
    
    HUD.bezelView.backgroundColor = [UIColor blackColor];
    HUD.contentColor = [UIColor blackColor];
    
    HUD.removeFromSuperViewOnHide = YES;
    [view addSubview:HUD];
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:kJwShowDuration];
}

+ (void)showCustomView:(NSString *)image text:(NSString *)text inView:(UIView *)view{
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.customView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:image] jw_imageByTintColor:[UIColor blackColor]]];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.detailsLabel.font = [UIFont systemFontOfSize:15];
    HUD.detailsLabel.text = text;
    
    HUD.bezelView.backgroundColor = [UIColor blackColor];
    HUD.contentColor = [UIColor blackColor];
    
    HUD.removeFromSuperViewOnHide = YES;
    [view addSubview:HUD];
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:kJwShowDuration];
}


@end
