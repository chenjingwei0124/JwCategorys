//
//  JwProjectModel.m
//  JwCompose
//
//  Created by 陈警卫 on 2019/9/12.
//  Copyright © 2019 陈警卫. All rights reserved.
//

#import "JwProjectModel.h"

@implementation JwProjectModel

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"Id" : @"id"}];
}

/** 注册TableViewCell */
+ (void)registerTableView:(UITableView *)tableView cellClassWithDatas:(NSArray *)datas{
    [datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        JwProjectModel *projectModel = (JwProjectModel *)obj;
        if (projectModel.jw_cellName){
            if (projectModel.jw_isXibCell) {
                [tableView registerNib:[UINib nibWithNibName:projectModel.jw_cellName bundle:nil] forCellReuseIdentifier:projectModel.jw_cellName];
            }else{
                [tableView registerClass:NSClassFromString(projectModel.jw_cellName) forCellReuseIdentifier:projectModel.jw_cellName];
            }
        }
    }];
}

/** 注册CollectionViewCell */
+ (void)registerCollectionView:(UICollectionView *)collectionView cellClassWithDatas:(NSArray *)datas{
    [datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        JwProjectModel *projectModel = (JwProjectModel *)obj;
        if (projectModel.jw_cellName){
            if (projectModel.jw_isXibCell) {
                [collectionView registerNib:[UINib nibWithNibName:projectModel.jw_cellName bundle:nil] forCellWithReuseIdentifier:projectModel.jw_cellName];
            }else{
                [collectionView registerClass:NSClassFromString(projectModel.jw_cellName) forCellWithReuseIdentifier:projectModel.jw_cellName];
            }
        }
        if (projectModel.jw_headName){
            if (projectModel.jw_isXibHead) {
                [collectionView registerNib:[UINib nibWithNibName:projectModel.jw_headName bundle:nil]
                 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:projectModel.jw_headName];
            }else{
                [collectionView registerClass:NSClassFromString(projectModel.jw_headName)
                   forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:projectModel.jw_headName];
            }
        }
        if (projectModel.jw_footName){
            if (projectModel.jw_isXibHead) {
                [collectionView registerNib:[UINib nibWithNibName:projectModel.jw_footName bundle:nil]
                 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:projectModel.jw_footName];
            }else{
                [collectionView registerClass:NSClassFromString(projectModel.jw_footName)
                   forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:projectModel.jw_footName];
            }
        }
    }];
}

@end
