//
//  NSData+JwCate.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/29.
//

#import "NSData+JwCate.h"
#import "JwMacro.h"

@implementation NSData (JwCate)

/** 解析JSON */
- (id)jw_jsonValueDecoded{
    NSError *error = nil;
    id value = [NSJSONSerialization JSONObjectWithData:self options:kNilOptions error:&error];
    if (error) {
        DLog(@"jsonValueDecoded error:%@", error);
    }
    return value;
}


@end
