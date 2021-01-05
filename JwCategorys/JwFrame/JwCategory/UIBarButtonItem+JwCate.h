//
//  UIBarButtonItem+JwCate.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (JwCate)

+ (UIBarButtonItem *)jw_itemWithTarget:(id)target action:(SEL)action image:(NSString *)image;

+ (UIBarButtonItem *)jw_itemWithTarget:(id)target action:(SEL)action image:(NSString *)image size:(CGSize)size;

+ (UIBarButtonItem *)jw_itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)color image:(NSString *)image;

@end

NS_ASSUME_NONNULL_END
