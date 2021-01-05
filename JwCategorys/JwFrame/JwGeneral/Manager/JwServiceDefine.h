
//
//  JwServiceDefine.h
//  JwCompose
//
//  Created by 陈警卫 on 2019/9/11.
//  Copyright © 2019 陈警卫. All rights reserved.
//

#ifndef JwServiceDefine_h
#define JwServiceDefine_h

//默认路径
#define kServiceBaseURL @"https://tapi-sip.510gow.com/"
//默认节点
#define kServiceBasePoint @"interface?action="
//混淆参数
#define kServiceBlur @"com.chenjingwei0124"
//appKey
#define kServiceAppKey @"5fb39a50c59a9"
//appSecret
#define kServiceAppSecret @"8d68a9777b8b7115364452c712837616"


typedef NS_ENUM(NSUInteger, Jw_HttpCode) {
    kHttpCodeSuccess = 0,//成功
};


#endif /* JwServiceDefine_h */
