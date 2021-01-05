//
//  UILabel+JwCate.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/28.
//

#import "UILabel+JwCate.h"
#import <CoreText/CoreText.h>

@implementation UILabel (JwCate)

/** 快速创建 */
+ (UILabel *)createLabelWithFont:(UIFont *)font
                        textColor:(UIColor *)textColor{
    UILabel *label = [UILabel createLabelWithFrame:CGRectZero
                                              text:nil
                                              font:font
                                     numberOfLines:0
                                         textColor:textColor
                                     textAlignment:(NSTextAlignmentLeft)];
    return label;
}

/** 快速创建 */
+ (UILabel *)createLabelWithFrame:(CGRect)frame
                             text:(NSString *)text
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor{
    UILabel *label = [UILabel createLabelWithFrame:frame
                                              text:text
                                              font:font
                                     numberOfLines:0
                                         textColor:textColor
                                     textAlignment:(NSTextAlignmentLeft)];
    return label;
}

/** 快速创建 */
+ (UILabel *)createLabelWithFrame:(CGRect)frame
                             text:(NSString *)text
                             font:(UIFont *)font
                    numberOfLines:(NSInteger)numberOfLines
                        textColor:(UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = font;
    label.numberOfLines = numberOfLines;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    return label;
}

/** 自适应宽度 */
- (CGFloat)jw_auto_width{
    CGSize size = [self sizeThatFits:CGSizeMake(MAXFLOAT, self.bounds.size.height)];
    return ceil(size.width);
}

/** 自适应高度 */
- (CGFloat)jw_auto_height{
    CGSize size = [self sizeThatFits:CGSizeMake(self.bounds.size.width, MAXFLOAT)];
    return ceil(size.height);
}

/** 自适应尺寸 */
- (CGSize)jw_auto_size{
    CGSize size = [self sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    return CGSizeMake(ceil(size.width), ceil(size.height));
}

/** 获取label中内容的行数和每一行的内容 */
- (NSArray *)jw_getLinesArrayOfStringInLabel{
    UILabel *label = self;
    NSString *text = [label text];
    UIFont *font = [label font];
    CGRect rect = [label frame];
    
    CTFontRef myFont = CTFontCreateWithName((CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge  id)myFont range:NSMakeRange(0, attStr.length)];
    CFRelease(myFont);
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, rect.size.width, 100000));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef = (__bridge CTLineRef)line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [text substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithInt:0.0]));
        [linesArray addObject:lineString];
    }
    CGPathRelease(path);
    CFRelease(frame);
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}

@end
