//
//  JwBaseReusableView.m
//  JwPart
//
//  Created by 陈警卫 on 2020/5/19.
//  Copyright © 2020 陈警卫. All rights reserved.
//

#import "JwBaseReusableView.h"
#import "JwCustomLayer.h"

@implementation JwBaseReusableView

- (void)setProjectModel:(JwProjectModel *)projectModel{
    _projectModel = projectModel;
}

#ifdef __IPHONE_11_0
+ (Class)layerClass {
    return [JwCustomLayer class];
}

#endif

@end
