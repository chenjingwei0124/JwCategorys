//
//  JwUserModel.h
//  JwCompose
//
//  Created by 陈警卫 on 2019/9/11.
//  Copyright © 2019 陈警卫. All rights reserved.
//

#import "JwBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JwUserModel : JwBaseModel

@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *headimg;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *sex;


@end

NS_ASSUME_NONNULL_END
