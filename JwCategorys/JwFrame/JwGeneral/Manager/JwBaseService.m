//
//  JwBaseService.m
//  JwCompose
//
//  Created by 陈警卫 on 2019/9/11.
//  Copyright © 2019 陈警卫. All rights reserved.
//

#import "JwBaseService.h"

@implementation JwBaseService

- (JwHttpManager *)httpManager{
    if (!_httpManager) {
        _httpManager = [JwHttpManager sharedManager];
    }
    return _httpManager;
}

//处理节点
- (NSString *)nodePoint:(NSString *)point{
    return [NSString stringWithFormat:@"%@%@", kServiceBasePoint, point];
}

//默认参数
- (NSMutableDictionary *)defaultParam:(NSDictionary *)param{
    NSMutableDictionary *defaultParam = [NSMutableDictionary dictionaryWithDictionary:param];
    
    //defaultParam[@"appKey"] = kServiceAppKey;
    
    defaultParam[@"os"] = @"iOS";
    defaultParam[@"osVersion"] = [JwCommon jw_commonSystemVersionString];
    defaultParam[@"appVersion"] = [JwCommon jw_commonVersionString];
    defaultParam[@"devid"] = [JwUUID jw_uuidDeviceString];
    defaultParam[@"osBrand"] = [JwiPhoneType jw_iPhoneType];
    defaultParam[@"timestamp"] = [JwCommon jw_commonTimestampString];
    
    //用户
    /**
     if (![JwCommon jw_isBlankWithString:[JwLocalCenter shared].sessionid]) {
     defaultParam[@"sessionid"] = [JwLocalCenter shared].sessionid;
     }
     if (![JwCommon jw_isBlankWithString:[JwLocalCenter shared].userModel.Id]) {
     defaultParam[@"uid"] = [JwLocalCenter shared].userModel.Id;
     }     
     */
    
    return defaultParam;
}

//签名参数
- (NSMutableDictionary *)signParam:(NSDictionary *)param{
    NSMutableString *signString = [NSMutableString string];
    NSMutableDictionary *signParam = [NSMutableDictionary dictionaryWithDictionary:param];
    
    NSArray *keyArray = [signParam allKeys];
    //通过key获取相应的 "key=value"
    NSMutableArray *keyValueArray = [NSMutableArray array];
    
    for (NSString *keyStr in keyArray) {
        NSString *valueStr = [signParam objectForKey:keyStr];
        if (![JwCommon jw_isBlankWithString:valueStr]) {
            NSString *keyValueStr = [NSString stringWithFormat:@"%@=%@", keyStr, valueStr];
            [keyValueArray addObject:keyValueStr];
        }
    }
    
    //按照字母升序排列
    NSArray *afterSortedKeyValueArray = [keyValueArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //升序
        NSComparisonResult result = [obj1 compare:obj2 options:NSLiteralSearch];
        return result;
    }];
    
    [afterSortedKeyValueArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            [signString appendString:[NSString stringWithFormat:@"%@", obj]];
        }else{
            [signString appendString:[NSString stringWithFormat:@"&%@", obj]];
        }
    }];
    
    [signString appendString:[NSString stringWithFormat:@"&secret=%@", kServiceAppSecret]];
    
    DLog(@"sign--%@", signString);
    signParam[@"sign"] = [[signString md5String] uppercaseString];
    return signParam;
}

@end
