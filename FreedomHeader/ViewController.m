//
//  ViewController.m
//  FreedomHeader
//
//  Created by zhangming on 2018/6/6.
//  Copyright © 2018年 zhangming. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "Masonry.h"
#import "UIView+Toast.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) HeaderView *headerView;

@end

@implementation ViewController

- (HeaderView *)headerView{
    
    if (!_headerView) {
        
        _headerView = [[HeaderView alloc] init];
    }
    
    return _headerView;
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.mas_equalTo(self.view.frame.size.width);
        }];
        
        
    }
    
    return _tableView;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"CELL";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *string = [NSString stringWithFormat:@"第%ld个cell",(long)indexPath.row];
    
    cell.textLabel.text = string;
    
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    
    // tableView 偏移20/64适配
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }
    

    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view);
    }];
    
    [self.tableView layoutIfNeeded];
    
    
    [self.view makeToastActivity:CSToastPositionCenter];
    
    //模拟请求数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.headerView setDes:@"过放荡不羁的生活，容易得像顺水推舟，但是要结识良朋益友，却难如登天。 —— 巴尔扎克"];
        
        //舒服的更新frame
        [self.tableView beginUpdates];
        [self.tableView setTableHeaderView:self.headerView];
        [self.tableView layoutIfNeeded];
        [self.tableView endUpdates];
        
        [self.view hideToastActivity];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
