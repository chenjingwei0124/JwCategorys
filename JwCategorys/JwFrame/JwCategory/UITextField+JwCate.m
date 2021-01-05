//
//  UITextField+JwCate.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/29.
//

#import "UITextField+JwCate.h"

@implementation UITextField (JwCate)

/** 设置placeholder */
- (void)jw_setupPlaceholderAttributedWithColor:(UIColor *)color text:(NSString *)text{
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:text
                                                               attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:self.font}];
    self.attributedPlaceholder = attr;
}

/** 设置placeholder */
- (void)jw_setupPlaceholderAttributedWithColor:(UIColor *)color text:(NSString *)text font:(UIFont *)font{
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:text
                                                               attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:font}];
    self.attributedPlaceholder = attr;
}

@end
