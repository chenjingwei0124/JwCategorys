//
//  UIImage+JwCate.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JwCate)

/** 颜色渲染 */
- (UIImage *)jw_imageByTintColor:(UIColor *)color;

/** 颜色图片 */
+ (UIImage *)jw_createImageWithColor:(UIColor *)color;

/** 颜色图片 */
+ (UIImage *)jw_createImageWithColor:(UIColor *)color size:(CGSize)size;

/** 调整图片大小 */
+ (UIImage *)jw_resizedSizeImage:(UIImage *)image size:(CGSize)size;

/** 调整图片大小 */
- (UIImage *)jw_resizeImageByToSize:(CGSize)size;

/** 在指定矩形内绘制图像 */
- (void)jw_drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode clipsToBounds:(BOOL)clips;

/** 缩放图像 图像内容根据ContentMode更改 */
- (UIImage *)jw_imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

/** 剪切图像 */
- (UIImage *)jw_imageByCropToRect:(CGRect)rect;

/** 圆角图像 */
- (UIImage *)jw_imageByRoundCornerRadius:(CGFloat)radius;

/** 设置圆角 边框 */
- (UIImage *)jw_imageByRoundCornerRadius:(CGFloat)radius
                             borderWidth:(CGFloat)borderWidth
                             borderColor:(nullable UIColor *)borderColor;
/** 设置圆角 边框  */
- (UIImage *)jw_imageByRoundCornerRadius:(CGFloat)radius
                                 corners:(UIRectCorner)corners
                             borderWidth:(CGFloat)borderWidth
                             borderColor:(nullable UIColor *)borderColor
                          borderLineJoin:(CGLineJoin)borderLineJoin;

/** view转变成image */
+ (UIImage *)jw_imageWithUIView:(UIView *)view;

/** 模糊图片 */
+ (UIImage *)jw_vagueImagerWithImage:(UIImage *)image withBlurLevel:(CGFloat)blur;

@end

NS_ASSUME_NONNULL_END
