//
//  JwLocalCenter.h
//  JwCompose
//
//  Created by 陈警卫 on 2019/9/11.
//  Copyright © 2019 陈警卫. All rights reserved.
//

#import "JwUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JwLocalCenter : JwBaseModel<NSCoding>

@property (nonatomic, strong) JwUserModel * __nullable userModel;
@property (nonatomic, strong) NSString * __nullable sessionid;

+ (instancetype)shared;

- (void)save;
- (void)clean;

@end

NS_ASSUME_NONNULL_END
