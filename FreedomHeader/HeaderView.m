//
//  HeaderView.m
//  FreedomHeader
//
//  Created by zhangming on 2018/6/6.
//  Copyright © 2018年 zhangming. All rights reserved.
//

#import "HeaderView.h"
#import "Masonry.h"

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
    
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor grayColor];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(0.5);
        make.left.right.equalTo(self);
        make.top.equalTo(icon.mas_bottom).offset(8);
        
    }];
    
    
    UIImageView *im = [UIImageView new];
    im.backgroundColor = [UIColor blackColor];
    im.image = [UIImage imageNamed:@"img_01"];
    im.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:im];
    [im mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(line);
        make.left.equalTo (self);
        make.width.equalTo(self);
        //make.height.mas_equalTo(30);
        //make.size.mas_equalTo(CGSizeMake(375, 375));
    }];
    
    
    UILabel *desLa = [UILabel new];
    NSString *a = @"皇马的T恤上写着“A por la 13”，意思是“为了第13冠”、“冲向第13冠”，相当于口号，给自己打气。事实上皇马每次晋级决赛之后，都会身穿类似的T恤庆祝晋级。但不少人以为皇马已经提前身穿了夺冠纪念T恤，抨击皇马缺乏尊重。皇马的T恤上写着“A por la 13”，意思是“为了第13冠”、“冲向第13冠”，相当于口号，给自己打气。事实上皇马每次晋级决赛之后，都会身穿类似的T恤庆祝晋级。但不少人以为皇马已经提前身穿了夺冠纪念T恤，抨击皇马缺乏尊重。";
    desLa.text = a;
    //desLa.textColor = FontColor;
    desLa.numberOfLines = 0;
    [self addSubview:desLa];
    
    //设置字间距
    NSDictionary *dic = @{
                          NSKernAttributeName:@1.f
                          };
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:a attributes:dic];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];//行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [a length])];
    
    [desLa setAttributedText:attributedString];
    
    [desLa sizeToFit];
    
    [desLa mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(im.mas_bottom).offset(16);
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self).offset(-8);
        
        //至关重要
        make.bottom.equalTo (self).offset(-8);
    }];
    
}

@end
