
//
//  JwShareAuthHeader.h
//  JwPart
//
//  Created by 陈警卫 on 2020/5/7.
//  Copyright © 2020 陈警卫. All rights reserved.
//

#ifndef JwShareAuthHeader_h
#define JwShareAuthHeader_h

#define IMPORT_SINA_WEIBO //注释此行则 不开启【 新浪微博 】平台
#define IMPORT_SUB_QQ //注释此行则 不开启【 QQ 】平台
#define IMPORT_SUB_Wechat //注释此行则 不开启【 微信 】平台

/** 以下为各平台的相关参数设置 */

//UniversalLink
#define MOBSSDKUniversalLink @"https://api-sip.510gow.com/"

#pragma mark - 新浪微博配置信息
/** 开放平台地址： http://open.weibo.com */

#ifdef IMPORT_SINA_WEIBO
//AppKey
#define MOBSSDKSinaWeiboAppKey @"3389791131"
//AppSecret
#define MOBSSDKSinaWeiboAppSecret @"bbaff4a5083d6097f74703e4e5cc4dbd"
#endif


#pragma mark - QQ平台的配置信息
/** 开放平台地址： http://open.qq.com */

#if defined IMPORT_SUB_QQ
//AppID
#define MOBSSDKQQAppID @"1110514410"
//AppKey
#define MOBSSDKQQAppKey @"exJOpwcUQ9SiXGFX"
#endif


#pragma mark - 微信平台的配置信息
/** 开放平台地址： https://open.weixin.qq.com */
#if defined IMPORT_SUB_Wechat
//AppID
#define MOBSSDKWeChatAppID @"wx302098a58b772f43"
//AppSecret
#define MOBSSDKWeChatAppSecret @"548dc9625d6d6a265c6d13d2954b9c71"
#endif

#endif /* JwShareAuthHeader_h */


/**
 微博开放平台
 地址    https://open.weibo.com/
 帐号    jjh@namei0gow.com
 密码    Jinjihu666.
 手机号    18114587630（周丽华招聘专用号）
 App Key    3389791131
 App Secret    bbaff4a5083d6097f74703e4e5cc4dbd
 
 微信开放平台
 地址    https://open.weixin.qq.com/
 帐号    13776357842@139.com
 密码    NAVI0gow
 App ID: wx302098a58b772f43
 App Secret: 548dc9625d6d6a265c6d13d2954b9c71
 
 腾讯开放平台 QQ开放平台
 地址    https://connect.qq.com/manage.html#/
 账号    1773049613
 密码    1800fighting)
 邮箱    18506181482@163.com
 APP ID    1110514410
 APP KEY    exJOpwcUQ9SiXGFX
 
 Bugly
 地址    https://bugly.qq.com/
 帐号    1773049613
 密码    1800fighting)（没实名认证无法改密）
 手机号    18506181482
 APP ID    cfb7e85b44
 APP KEY    faba1028-7bc9-48e8-9383-2bb70c7084e0
 
 极光
 地址    https://www.jiguang.cn/
 邮箱    jjh@namei0gow.com
 密码    Jinjihu666.
 APP KEY    d7cafca84c303ea1cc4b2ad5
 Master Secret    703532077727a1a953d8ccc0
 
 MobTech
 地址    http://www.mob.com/
 手机号    18506181482
 邮箱    jjh@namei0gow.com
 密码    Jinjihu666.
 App Key    2f4c1ef8c86c8
 App Secret    512dd337c7431a09d3d21a68581c5b17
 */
