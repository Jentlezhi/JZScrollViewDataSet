//
//  JZViewController.m
//  JZScrollViewDataSet
//
//  Created by Jentle on 11/17/2023.
//  Copyright (c) 2023 Jentle. All rights reserved.
//

#import "JZDateSetViewController.h"
#import "JZScrollViewDataSet.h"
#import "JZScrollViewDataSet.h"
#import "Masonry.h"
#import "YYCategories.h"
#import <MJRefresh/MJRefresh.h>

@interface JZDateSetViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray <NSString*> *list;

@end

@implementation JZDateSetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSet = [JZScrollViewDataSet defaultDataSet];
//    self.tableView.dataSet = [JZScrollViewDataSet dataSetWithEmptyView:^UIView * _Nullable{
//        UILabel *label = [UILabel new];
//        label.text = @"-- 无数据 --";
//        label.textAlignment = NSTextAlignmentCenter;
//        return label;
//    } errorView:^UIView * _Nullable{
//        UILabel *label = [UILabel new];
//        label.text = @"-- 网络加载失败 --";
//        label.textAlignment = NSTextAlignmentCenter;
//        return label;
//    } tap:^{
//        NSLog(@"点我干嘛！！！");
//    }];
    
    self.tableView.dataSet.tapBlock = ^{
        NSLog(@"点我就滚开~~~");
    };
    
    UILabel *label = [UILabel new];
    label.text = @"-- 我是空数据 --";
    label.textAlignment = NSTextAlignmentCenter;
    self.tableView.dataSet.emptyView = label;
    
    UILabel *label1 = [UILabel new];
    label1.text = @"-- 我是错误数据 --";
    label1.textAlignment = NSTextAlignmentCenter;
    self.tableView.dataSet.errorView = label1;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            // Fallback on earlier versions
        }
        make.left.right.bottom.equalTo(self.view);
    }];
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf requestDataWithTime:3.f completion:^(NSArray<NSString *> *data) {
            static NSInteger count = 0;
            weakSelf.tableView.dataSetType = JZScrollViewDataSetTypeError;
            count++;
            [weakSelf.tableView.mj_header endRefreshing];
            weakSelf.list = @[];
//            [weakSelf.tableView reloadEmptyDataSet];
            [weakSelf.tableView reloadData];
        }];
        
    }];

    
    
    [self requestDataWithTime:0.f completion:^(NSArray<NSString *> *data) {
//        self.list = @[@"1",@"2"];
        [self.tableView reloadData];
    }];
}

- (void)test {
    NSLog(@"%s",__func__);
}

- (void)requestDataWithTime:(CGFloat)timeSec
                 completion:(void(^)(NSArray <NSString*> *data))completion {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeSec * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        int count = arc4random() % 10;
        if (count < 7) {
            count = 0;
        } else if (count < 7) {
            count+=10;
        }
        NSMutableArray *list = @[].mutableCopy;
        for (int index = 0; index < count; index++) {
            [list addObject:[NSString stringWithFormat:@"%d",index]];
        }
        !completion?:completion(list);
    });
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        UIView *header = [UIView new];
        header.frame = CGRectMake(0, 0, 0.f, CGFLOAT_MIN);
        _tableView.tableHeaderView = header;
        _tableView.sectionHeaderHeight = CGFLOAT_MIN;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        if (@available(iOS 15.0, *)) {
            _tableView.sectionHeaderTopPadding = 0.f;
        }
    }
    return _tableView;
}

#pragma mark - Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = self.list[indexPath.row];
    return cell;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
