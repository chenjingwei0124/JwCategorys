//
//  NSString+JwCate.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JwCate)

/** 获取字符串高度 */
- (CGFloat)jw_heightForLabelWidth:(CGFloat)width fontsize:(CGFloat)fontsize;
/** 获取字符串高度 */
- (CGFloat)jw_heightForLabelWidth:(CGFloat)width font:(UIFont *)font;
/** 获取字符串宽度 */
- (CGFloat)jw_widthForLabelHeight:(CGFloat)height fontsize:(CGFloat)fontsize;
/** 获取字符串宽度 */
- (CGFloat)jw_widthForLabelHeight:(CGFloat)height font:(UIFont *)font;
/** 获取字符串尺寸 */
- (CGSize)jw_sizeForFont:(UIFont *)font expectSize:(CGSize)expectSize lineBreakMode:(NSLineBreakMode)lineBreakMode;

/** 获取UILabel高度 */
- (CGFloat)jw_heightForUILabelWidth:(CGFloat)width font:(UIFont *)font;
/** 获取UILabel宽度 */
- (CGFloat)jw_widthForUILabelHeight:(CGFloat)height font:(UIFont *)font;
/**
 自定义正数格式(金额的格式转化) 94,862.57
 
 @param str 数字字符
 @return 金额格式
 */
+ (NSString *)jw_stringChangeMoneyWithStr:(NSString *)str;
/**
 中国正数格式(金额的格式转化) ￥94,862.57这样的形式
 金额的格式转化 ￥94,862.57这样的形式
 @param str 数字字符
 @return 金额格式
 */
+ (NSString *)jw_stringChangeCNMoneyWithStr:(NSString *)str;
/**
 金额的格式转化
 
 @param str 数字字符
 @param numberStyle 属性
 @return 金额格式
 */
+ (NSString *)jw_stringChangeMoneyWithStr:(NSString *)str numberStyle:(NSNumberFormatterStyle)numberStyle;

/** 银行卡号格式显示 */
- (NSString *)jw_stringBankCardNumberFormat;
/** 银行卡号格式加密显示 */
- (NSString *)jw_stringBankCardNumberEncryptFormat;

/** 数字过大格式转化 */
- (NSString *)jw_changeAmountAsset;


/** 去除收尾空格 */
- (NSString *)jw_stringByTrim;
/**
 nil, @"", @"  ", @"\n" will Returns NO; otherwise Returns YES.
 */
- (BOOL)jw_isNotBlank;

/** 转data */
- (NSData *)jw_dataValue;

/** 解析JSON */
- (id)jw_jsonValueDecoded;

@end

NS_ASSUME_NONNULL_END
