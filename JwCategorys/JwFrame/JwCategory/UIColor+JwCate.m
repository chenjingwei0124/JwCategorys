//
//  UIColor+JwCate.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/16.
//

#import "UIColor+JwCate.h"

@implementation UIColor (JwCate)
/** 十六进制颜色 */
+ (UIColor *)jw_colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((CGFloat)((hex & 0xFF0000) >> 16))/255.0
                           green:((CGFloat)((hex & 0xFF00) >> 8))/255.0
                            blue:((CGFloat)(hex & 0xFF))/255.0 alpha:alpha];
}
/** 十六进制颜色 */
+ (UIColor *)jw_colorWithHex:(NSInteger)hex{
    return [UIColor jw_colorWithHex:hex alpha:1.0];
}
/** 十六进制转换 */
+ (CGFloat)jw_colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat:@"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString:fullHex] scanHexInt:&hexComponent];
    return hexComponent / 255.0;
}
/** 十六进制字符串颜色 */
+ (UIColor *)jw_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha{
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat red, blue, green;
    switch ([colorString length]) {
        case 3: //#RGB
            alpha = alpha;
            red   = [self jw_colorComponentFrom:colorString start:0 length:1];
            green = [self jw_colorComponentFrom:colorString start:1 length:1];
            blue  = [self jw_colorComponentFrom:colorString start:2 length:1];
            break;
        case 4: //#ARGB
            alpha = [self jw_colorComponentFrom:colorString start:0 length:1];
            red   = [self jw_colorComponentFrom:colorString start:1 length:1];
            green = [self jw_colorComponentFrom:colorString start:2 length:1];
            blue  = [self jw_colorComponentFrom:colorString start:3 length:1];
            break;
        case 6: //#RRGGBB
            alpha = alpha;
            red   = [self jw_colorComponentFrom:colorString start:0 length:2];
            green = [self jw_colorComponentFrom:colorString start:2 length:2];
            blue  = [self jw_colorComponentFrom:colorString start:4 length:2];
            break;
        case 8: //#AARRGGBB
            alpha = [self jw_colorComponentFrom:colorString start:0 length:2];
            red   = [self jw_colorComponentFrom:colorString start:2 length:2];
            green = [self jw_colorComponentFrom:colorString start:4 length:2];
            blue  = [self jw_colorComponentFrom:colorString start:6 length:2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
/** 十六进制字符串颜色 */
+ (UIColor *)jw_colorWithHexString:(NSString *)hexString{
    return [UIColor jw_colorWithHexString:hexString alpha:1.0];
}

/** 取UIColor的rgba */
JwRGBA jw_rgbaFromUIColor(UIColor *color){
    return jw_rgbaFromCGColor(color.CGColor);
}
/** 取UIColor的rgba */
JwRGBA jw_rgbaFromCGColor(CGColorRef color){
    
    JwRGBA rgba;
    CGColorSpaceRef color_space = CGColorGetColorSpace(color);
    CGColorSpaceModel color_space_model = CGColorSpaceGetModel(color_space);
    const CGFloat *color_components = CGColorGetComponents(color);
    size_t color_component_count;
    color_component_count = CGColorGetNumberOfComponents(color);
    
    switch (color_space_model){
        case kCGColorSpaceModelMonochrome:{
            assert(color_component_count == 2);
            rgba = (JwRGBA){
                .r = color_components[0],
                .g = color_components[0],
                .b = color_components[0],
                .a = color_components[1]
            };
            break;
        }
        case kCGColorSpaceModelRGB:{
            assert(color_component_count == 4);
            rgba = (JwRGBA){
                .r = color_components[0],
                .g = color_components[1],
                .b = color_components[2],
                .a = color_components[3]
            };
            break;
        }
        default:{
            rgba = (JwRGBA) {0, 0, 0, 0};
            break;
        }
    }
    return rgba;
}
/** 颜色渐变 */
+ (UIColor *)jw_colorWithFormColor:(UIColor *)fromColor toColor:(UIColor *)toColor value:(float)value{
    JwRGBA f = jw_rgbaFromUIColor(fromColor);
    JwRGBA t = jw_rgbaFromUIColor(toColor);
    
    CGFloat r = f.r + (t.r - f.r) * value;
    CGFloat g = f.g + (t.g - f.g) * value;
    CGFloat b = f.b + (t.b - f.b) * value;
    CGFloat a = f.a + (t.a - f.a) * value;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}
/** 获取当前UIColor对象里的红色色值 */
- (CGFloat)jw_red {
    CGFloat r;
    if ([self getRed:&r green:0 blue:0 alpha:0]) {
        return r;
    }
    return 0;
}
/** 获取当前UIColor对象里的绿色色值 */
- (CGFloat)jw_green {
    CGFloat g;
    if ([self getRed:0 green:&g blue:0 alpha:0]) {
        return g;
    }
    return 0;
}
/** 获取当前UIColor对象里的蓝色色值 */
- (CGFloat)jw_blue {
    CGFloat b;
    if ([self getRed:0 green:0 blue:&b alpha:0]) {
        return b;
    }
    return 0;
}
/** 获取当前UIColor对象里的透明色值 */
- (CGFloat)jw_alpha {
    CGFloat a;
    if ([self getRed:0 green:0 blue:0 alpha:&a]) {
        return a;
    }
    return 0;
}
/** 获取当前UIColor对象里的hue（色相） */
- (CGFloat)jw_hue {
    CGFloat h;
    if ([self getHue:&h saturation:0 brightness:0 alpha:0]) {
        return h;
    }
    return 0;
}
/** 获取当前UIColor对象里的saturation（饱和度） */
- (CGFloat)jw_saturation {
    CGFloat s;
    if ([self getHue:0 saturation:&s brightness:0 alpha:0]) {
        return s;
    }
    return 0;
}
/** 获取当前UIColor对象里的brightness（亮度） */
- (CGFloat)jw_brightness {
    CGFloat b;
    if ([self getHue:0 saturation:0 brightness:&b alpha:0]) {
        return b;
    }
    return 0;
}
/** 将当前UIColor对象剥离掉alpha通道后得到的色值。相当于把当前颜色的半透明值强制设为1.0后返回 */
- (UIColor *)jw_colorWithoutAlpha {
    CGFloat r;
    CGFloat g;
    CGFloat b;
    if ([self getRed:&r green:&g blue:&b alpha:0]) {
        return [UIColor colorWithRed:r green:g blue:b alpha:1];
    } else {
        return nil;
    }
}

/** 将自身变化到某个目标颜色，可通过参数progress控制变化的程度，最终得到一个纯色 */
- (UIColor *)jw_qmui_transitionToColor:(UIColor *)toColor progress:(CGFloat)progress{
    return [UIColor jw_qmui_colorFromColor:self toColor:toColor progress:progress];
}

/** 计算两个颜色叠加之后的最终色（注意区分前景色后景色的顺序）*/
+ (UIColor *)jw_qmui_colorWithBackendColor:(UIColor *)backendColor frontColor:(UIColor *)frontColor{
    CGFloat bgAlpha = [backendColor jw_alpha];
    CGFloat bgRed = [backendColor jw_red];
    CGFloat bgGreen = [backendColor jw_green];
    CGFloat bgBlue = [backendColor jw_blue];
    
    CGFloat frAlpha = [frontColor jw_alpha];
    CGFloat frRed = [frontColor jw_red];
    CGFloat frGreen = [frontColor jw_green];
    CGFloat frBlue = [frontColor jw_blue];
    
    CGFloat resultAlpha = frAlpha + bgAlpha * (1 - frAlpha);
    CGFloat resultRed = (frRed * frAlpha + bgRed * bgAlpha * (1 - frAlpha)) / resultAlpha;
    CGFloat resultGreen = (frGreen * frAlpha + bgGreen * bgAlpha * (1 - frAlpha)) / resultAlpha;
    CGFloat resultBlue = (frBlue * frAlpha + bgBlue * bgAlpha * (1 - frAlpha)) / resultAlpha;
    return [UIColor colorWithRed:resultRed green:resultGreen blue:resultBlue alpha:resultAlpha];
}

/** 将颜色A变化到颜色B，可通过progress控制变化的程度 */
+ (UIColor *)jw_qmui_colorFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor progress:(CGFloat)progress{
    progress = MIN(progress, 1.0f);
    CGFloat fromRed = fromColor.jw_red;
    CGFloat fromGreen = fromColor.jw_green;
    CGFloat fromBlue = fromColor.jw_blue;
    CGFloat fromAlpha = fromColor.jw_alpha;
    
    CGFloat toRed = toColor.jw_red;
    CGFloat toGreen = toColor.jw_green;
    CGFloat toBlue = toColor.jw_blue;
    CGFloat toAlpha = toColor.jw_alpha;
    
    CGFloat finalRed = fromRed + (toRed - fromRed) * progress;
    CGFloat finalGreen = fromGreen + (toGreen - fromGreen) * progress;
    CGFloat finalBlue = fromBlue + (toBlue - fromBlue) * progress;
    CGFloat finalAlpha = fromAlpha + (toAlpha - fromAlpha) * progress;
    
    return [UIColor colorWithRed:finalRed green:finalGreen blue:finalBlue alpha:finalAlpha];
}

/** 适配暗黑模式 */
+ (UIColor *)jw_colorDynamicWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor{
    if (@available(iOS 13.0, *)) {
        UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trait) {
            if ([trait userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return lightColor;
            } else {
                return darkColor;
            }
        }];
        return color;
    }else{
        return lightColor;
    }
}
/** 适配暗黑模式 */
+ (UIColor *)jw_colorDynamicWithHexString:(NSString *)lightString darkString:(NSString *)darkString{
    if (@available(iOS 13.0, *)) {
        UIColor *color =  [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trait) {
            if ([trait userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return [UIColor jw_colorWithHexString:lightString alpha:1.0];
            } else {
                return [UIColor jw_colorWithHexString:darkString alpha:1.0];
            }
        }];
        return color;
    } else {
        return [UIColor jw_colorWithHexString:lightString alpha:1.0];
    }
}
/** 获取颜色十六进制值 */
- (NSString *)jw_hexString {
    return [self jw_hexStringWithAlpha:NO];
}
/** 获取颜色十六进制值 */
- (NSString *)jw_hexStringWithAlpha {
    return [self jw_hexStringWithAlpha:YES];
}
/** 获取颜色十六进制值 */
- (NSString *)jw_hexStringWithAlpha:(BOOL)withAlpha {
    CGColorRef color = self.CGColor;
    size_t count = CGColorGetNumberOfComponents(color);
    const CGFloat *components = CGColorGetComponents(color);
    static NSString *stringFormat = @"%02x%02x%02x";
    NSString *hex = nil;
    if (count == 2) {
        NSUInteger white = (NSUInteger)(components[0] * 255.0f);
        hex = [NSString stringWithFormat:stringFormat, white, white, white];
    } else if (count == 4) {
        hex = [NSString stringWithFormat:stringFormat,
               (NSUInteger)(components[0] * 255.0f),
               (NSUInteger)(components[1] * 255.0f),
               (NSUInteger)(components[2] * 255.0f)];
    }
    
    if (hex && withAlpha) {
        hex = [hex stringByAppendingFormat:@"%02lx",
               (unsigned long)(self.jw_alpha * 255.0 + 0.5)];
    }
    return hex;
}


@end
