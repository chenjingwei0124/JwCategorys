//
//  UIView+JwNib.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JwNib)

+ (instancetype)jw_createViewFromNib;
+ (instancetype)jw_createViewFromNibName:(NSString *)nibName;

@end

NS_ASSUME_NONNULL_END
