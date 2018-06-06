//
//  HeaderView.m
//  FreedomHeader
//
//  Created by zhangming on 2018/6/6.
//  Copyright © 2018年 zhangming. All rights reserved.
//

#import "HeaderView.h"
#import "Masonry.h"

@interface HeaderView()

@property (strong, nonatomic) UILabel *desLa;

@end

@implementation HeaderView

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self setUI];
    }
    
    return self;
}

- (void)setUI{
    
    UIImageView *icon = [UIImageView new];
    icon.image = [UIImage imageNamed:@"icon"];
    [self addSubview:icon];
    
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).offset(16);
        make.left.equalTo(self).offset(16);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    
    UILabel *titleLa = [UILabel new];
    titleLa.text = @"标题";
    [self addSubview:titleLa];
    [titleLa mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(icon);
        make.left.equalTo(icon.mas_right).offset(8);
        make.height.mas_equalTo(50);
    }];
    
    UILabel *timeLa = [UILabel new];
    timeLa.text = @"15:00";
    [self addSubview:timeLa];
    [timeLa mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(icon);
        make.right.equalTo(self).offset(16);
        make.size.mas_equalTo(CGSizeMake(80, 50));
        
    }];
    
    
    UIImageView *im = [UIImageView new];
    im.backgroundColor = [UIColor blackColor];
    im.image = [UIImage imageNamed:@"img_01"];
    im.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:im];
    [im mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(icon.mas_bottom).offset(15);
        make.left.equalTo (self);
        make.width.equalTo(self);
        //make.height.mas_equalTo(250);
    
    }];
    
    
    UILabel *desLa = [UILabel new];
    [self addSubview:desLa];
    self.desLa = desLa;
    desLa.text = @"1213";
    desLa.numberOfLines = 0;
    [desLa mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(im.mas_bottom).offset(16);
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self).offset(-8);
        
    }];
    
    //横线
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor colorWithRed:216.0/255.0 green:216.0/255.0 blue:216.0/255.0 alpha:0.5];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(0.5);
        make.left.right.equalTo(self);
        make.top.equalTo(desLa.mas_bottom).offset(15);
        //至关重要
        make.bottom.equalTo (self).offset(-0.5);
    }];
}

- (void)setDes:(NSString *)des{
    
    //设置字间距
    NSDictionary *dic = @{
                          NSKernAttributeName:@1.f
                          };
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:des attributes:dic];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];//行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [des length])];
    
    [self.desLa setAttributedText:attributedString];
    
    [self.desLa sizeToFit];
}
@end
