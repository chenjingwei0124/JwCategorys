//
//  JwCellWebCell.h
//  JwCategorys
//
//  Created by 陈警卫 on 2021/4/15.
//

#import "JwBaseTableCell.h"
#import "JwCellWebModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JwCellWebCell : JwBaseTableCell

@property (nonatomic, strong) JwCellWebModel *cellWebModel;
@property (nonatomic, copy) void(^didFinishAction)(CGFloat height);


@end

NS_ASSUME_NONNULL_END
