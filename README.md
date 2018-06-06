# FreedomHeader
headerView高度自适应

效果图：![image](https://github.com/1192484280/FreedomHeader/blob/master/QQ20180606-172433-HD.gif)

1.view部分

headerView采用masonry布局。

UILabel *titleLa = [UILabel new];
    titleLa.textColor = FontColor;
    titleLa.text = @"title";
    [self addSubview:titleLa];
    [titleLa mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(img);
        make.left.equalTo(img.mas_right).offset(8);
        make.height.mas_equalTo(50);
        //至关重要
         make.bottom.equalTo(self);
    }];

一定记得在最后控件设置 make.bottom；

2.Controller部分
[self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.mas_equalTo(self.view.frame.size.width);
        }];

[self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view);
    }];
    
[self.tableView layoutIfNeeded];


数据请求完成刷新frame
[self.tableView beginUpdates];
[self.tableView setTableHeaderView:self.headerView];
[self.tableView layoutIfNeeded];
[self.tableView endUpdates];
