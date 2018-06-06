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

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController


- (UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    
        HeaderView *headerView = [[HeaderView alloc] init];
        _tableView.tableHeaderView = headerView;
        [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.mas_equalTo(self.view.frame.size.width);
        }];
        
        
    }
    
    return _tableView;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
