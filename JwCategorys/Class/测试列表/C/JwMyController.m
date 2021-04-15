//
//  JwMyController.m
//  JwCategorys
//
//  Created by 陈警卫 on 2021/2/24.
//

#import "JwMyController.h"

@interface JwMyController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datas;
//
@property (nonatomic, strong) NSDictionary *param;

@end

@implementation JwMyController

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
    
    self.param = @{@"图片叠加测试" : @"JwTuPianDieJiaController",
                   @"Web测试" : @"JwWebController",
                   @"CellWeb" : @"JwCellWebController"
    };
    
    self.datas = [NSMutableArray arrayWithArray:self.param.allKeys];
    [self.tableView reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *title = self.datas[indexPath.row];
    NSString *value = [self.param valueForKey:title];
    
    Class class = NSClassFromString(value);
    UIViewController *vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
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
