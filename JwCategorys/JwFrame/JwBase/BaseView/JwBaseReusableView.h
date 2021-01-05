//
//  JwBaseReusableView.h
//  JwPart
//
//  Created by 陈警卫 on 2020/5/19.
//  Copyright © 2020 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JwMacro.h"
#import "JwCategoryer.h"
#import "JwExtener.h"
#import "JwProjectModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JwBaseReusableView : UICollectionReusableView

@property (nonatomic, strong) JwProjectModel *projectModel;

@end

NS_ASSUME_NONNULL_END
