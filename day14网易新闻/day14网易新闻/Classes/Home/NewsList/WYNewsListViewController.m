//
//  WYNewsListViewController.m
//  day14网易新闻
//
//  Created by Jack.Lin on 16/6/15.
//  Copyright © 2016年 Jack.Lin. All rights reserved.
//

#import "WYNewsListViewController.h"

static NSString *cellId = @"cellId";

@interface WYNewsListViewController () <UITableViewDataSource>

@end

@implementation WYNewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - UITableViewDataSource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.textLabel.text = @(indexPath.row).description;
    
    return cell;
    
}


#pragma mark - 搭建界面
- (void)setupUI {
    
    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.view addSubview:tv];
    
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    tv.dataSource = self;
    
    
    
}



@end
