//
//  JwCellWebController.m
//  JwCategorys
//
//  Created by 陈警卫 on 2021/4/15.
//

#import "JwCellWebController.h"
#import "JwCellWebCell.h"
#import "JwCellWebModel.h"

@interface JwCellWebController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datas;


@end

@implementation JwCellWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupView];
    [self setupData];
}

- (void)setupView{
    
    self.tableView = [[UITableView alloc] initWithFrame:(CGRectZero) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(kJwScreenNavBatBarHeight);
        make.bottom.offset(-kJwScreenTabBottomBarHeight);
    }];
}

- (void)setupData{
    
    self.datas = [NSMutableArray array];
    
    JwCellWebModel *model1 = [[JwCellWebModel alloc] init];
    model1.url = @"https://www.baidu.com/";
    [self.datas addObject:model1];
    
    JwCellWebModel *model2 = [[JwCellWebModel alloc] init];
    model2.url = @"https://www.bilibili.com/";;
    [self.datas addObject:model2];
    
    
    [self.datas addObjectsFromArray:self.datas];
    [self.datas addObjectsFromArray:self.datas];
    [self.datas addObjectsFromArray:self.datas];
    [self.datas addObjectsFromArray:self.datas];
    
    [self.tableView reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    JwCellWebModel *model = self.datas[indexPath.row];
    return model.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"JwCellWebCell";
    JwCellWebCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[JwCellWebCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    JwCellWebModel *cellWebModel = self.datas[indexPath.row];
    cell.cellWebModel = cellWebModel;
    
    cell.didFinishAction = ^(CGFloat height) {
        
        if (cellWebModel.height == 0) {
            
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationNone)];
            cellWebModel.height = height;
        }
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
