//
//  WYNewsListViewController.m
//  day14网易新闻
//
//  Created by Jack.Lin on 16/6/15.
//  Copyright © 2016年 Jack.Lin. All rights reserved.
//

#import "WYNewsListViewController.h"
#import "WYNewsListItem.h"
#import <UIImageView+WebCache.h>
#import "WYNewsCell.h"

static NSString *cellId = @"cellId";
static NSString *normalCellId = @"normalCellId";
static NSString *extraCellId = @"extraCellId";
static NSString *bigImageCellId = @"bigImageCellId";

@interface WYNewsListViewController () <UITableViewDataSource , UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray <WYNewsListItem *> *newsList;

@end

@implementation WYNewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (void)loadData {
    
//    [[CZNetworkManager sharedManager] newsListWithChannel:@"T1348649079062" start:0 completion:^(NSArray *array, NSError *error) {
    [[CZNetworkManager sharedManager] newsListWithChannel:@"T1348648517839" start:0 completion:^(NSArray *array, NSError *error) {
    NSLog(@"array");
        
        NSArray *list = [NSArray yy_modelArrayWithClass:[WYNewsListItem class] json:array];
        
        self.newsList = [NSMutableArray arrayWithArray:list];
        
        [self.tableView reloadData];
        
    }];
}


#pragma mark - UITableViewDataSource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WYNewsListItem *model = _newsList[indexPath.row];
    
    NSString *cellId;
    if (model.imgType) {
        cellId = bigImageCellId;
    } else if (model.imgextra.count > 0) {
        cellId = extraCellId;
    } else {
        cellId = normalCellId;
    }
    
    WYNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.titleLabel.text = model.title;
    cell.sourceLabel.text = model.source;
    cell.replyLabel.text = @(model.replyCount).description;
    
    NSURL *imageURL = [NSURL URLWithString:model.imgsrc];
    [cell.iconView sd_setImageWithURL:imageURL];
    
    return cell;
}

#pragma mark - 搭建界面
- (void)setupUI {
    
    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.view addSubview:tv];
    
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [tv registerNib:[UINib nibWithNibName:@"WYNewsNormalCell" bundle:nil] forCellReuseIdentifier:normalCellId];
    [tv registerNib:[UINib nibWithNibName:@"WYNewsExtraImagesCell" bundle:nil] forCellReuseIdentifier:extraCellId];
    [tv registerNib:[UINib nibWithNibName:@"WYNewsBigImageCell" bundle:nil] forCellReuseIdentifier:bigImageCellId];
    
    tv.estimatedRowHeight = 100;
    tv.rowHeight = UITableViewAutomaticDimension;
    
    tv.dataSource = self;
    tv.delegate = self;
    
    _tableView = tv;
    
}



@end
