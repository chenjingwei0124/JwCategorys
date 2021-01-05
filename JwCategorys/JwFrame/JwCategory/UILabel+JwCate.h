//
//  UILabel+JwCate.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (JwCate)

/** 快速创建 */
+ (UILabel *)createLabelWithFont:(UIFont *)font
                       textColor:(nullable UIColor *)textColor;

/** 快速创建 */
+ (UILabel *)createLabelWithFrame:(CGRect)frame
                             text:(nullable NSString *)text
                             font:(UIFont *)font
                        textColor:(nullable UIColor *)textColor;

/** 快速创建 */
+ (UILabel *)createLabelWithFrame:(CGRect)frame
                             text:(nullable NSString *)text
                             font:(UIFont *)font
                    numberOfLines:(NSInteger)numberOfLines
                        textColor:(nullable UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment;

/** 自适应宽度 */
- (CGFloat)jw_auto_width;

/** 自适应高度 */
- (CGFloat)jw_auto_height;

/** 自适应尺寸 */
- (CGSize)jw_auto_size;

/** 获取label中内容的行数和每一行的内容 */
- (NSArray *)jw_getLinesArrayOfStringInLabel;



@end

NS_ASSUME_NONNULL_END
