//
//  NSData+JwCate.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (JwCate)

/** 解析JSON */
- (id)jw_jsonValueDecoded;

@end

NS_ASSUME_NONNULL_END
