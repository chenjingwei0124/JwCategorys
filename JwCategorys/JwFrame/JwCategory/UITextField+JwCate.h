//
//  UITextField+JwCate.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (JwCate)

/** 设置placeholder */
- (void)jw_setupPlaceholderAttributedWithColor:(UIColor *)color text:(NSString *)text;

/** 设置placeholder */
- (void)jw_setupPlaceholderAttributedWithColor:(UIColor *)color text:(NSString *)text font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
