//
//  UIColor+JwCate.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/16.
//

#import <UIKit/UIKit.h>

/** RGB颜色 */
#define kJwColorRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
/** RGBA颜色 */
#define kJwColorRGBA(r, g, b, a)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]
/** 随机颜色 */
#define kJwColorRandom kJwColorRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

/** HexString颜色 */
#define kJwColorHexString(h) [UIColor jw_colorWithHexString:(h)]
#define kJwColorHexAString(h, a) [UIColor jw_colorWithHexString:(h) alpha:(a)]

/** 暗黑颜色适配 */
#define kJwColorDynamicColor(l, d) [UIColor jw_colorDynamicWithLightColor:(l) darkColor:(d)]
#define kJwColorDynamicHexString(l, d) [UIColor jw_colorDynamicWithHexString:(l) darkString:(d)]

typedef struct
{
    CGFloat r;
    CGFloat g;
    CGFloat b;
    CGFloat a;
}JwRGBA;

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JwCate)

/** 十六进制颜色 */
+ (UIColor *)jw_colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha;
/** 十六进制颜色 */
+ (UIColor *)jw_colorWithHex:(NSInteger)hex;

/** 十六进制字符串颜色 */
+ (UIColor *)jw_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
/** 十六进制字符串颜色 */
+ (UIColor *)jw_colorWithHexString:(NSString *)hexString;

/** 取UIColor的rgba */
JwRGBA jw_rgbaFromUIColor(UIColor *color);
/** 取UIColor的rgba */
JwRGBA jw_rgbaFromCGColor(CGColorRef color);

/** 颜色渐变 */
+ (UIColor *)jw_colorWithFormColor:(UIColor *)fromColor toColor:(UIColor *)toColor value:(float)value;

/** 获取当前UIColor对象里的红色色值 */
- (CGFloat)jw_red;
/** 获取当前UIColor对象里的绿色色值 */
- (CGFloat)jw_green;
/** 获取当前UIColor对象里的蓝色色值 */
- (CGFloat)jw_blue;
/** 获取当前UIColor对象里的透明色值 */
- (CGFloat)jw_alpha;
/** 获取当前UIColor对象里的hue（色相）*/
- (CGFloat)jw_hue;
/** 获取当前UIColor对象里的saturation（饱和度）*/
- (CGFloat)jw_saturation;
/** 获取当前UIColor对象里的brightness（亮度）*/
- (CGFloat)jw_brightness;
/** 将当前UIColor对象剥离掉alpha通道后得到的色值。相当于把当前颜色的半透明值强制设为1.0后返回 */
- (UIColor *)jw_colorWithoutAlpha;

/** 将自身变化到某个目标颜色，可通过参数progress控制变化的程度，最终得到一个纯色 */
- (UIColor *)jw_qmui_transitionToColor:(UIColor *)toColor progress:(CGFloat)progress;

/** 计算两个颜色叠加之后的最终色（注意区分前景色后景色的顺序）*/
+ (UIColor *)jw_qmui_colorWithBackendColor:(UIColor *)backendColor frontColor:(UIColor *)frontColor;

/** 将颜色A变化到颜色B，可通过progress控制变化的程度 */
+ (UIColor *)jw_qmui_colorFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor progress:(CGFloat)progress;

/** 适配暗黑模式 */
+ (UIColor *)jw_colorDynamicWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;
/** 适配暗黑模式 */
+ (UIColor *)jw_colorDynamicWithHexString:(NSString *)lightString darkString:(NSString *)darkString;

@end

NS_ASSUME_NONNULL_END
