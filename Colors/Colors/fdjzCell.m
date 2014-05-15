//
//  fdjzCell.m
//  Colors
//
//  Created by SHENFENG125 on 14-4-4.
//  Copyright (c) 2014年 ice cream studios s.r.l. All rights reserved.
//

#import "fdjzCell.h"
@interface fdjzCell()

@end
@implementation fdjzCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        NSLog(@"..................***");
        _count = 0;
         _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 38, 38)];
        [self.contentView addSubview:_imageView];
        _label = [[UILabel alloc]initWithFrame:CGRectMake(58, 2, 120, 36)];
        _label.font = [UIFont boldSystemFontOfSize:16];
        _label.textColor = [UIColor blackColor];
        _label.backgroundColor = [UIColor clearColor];
        _label.userInteractionEnabled = YES;
        
        [self.contentView addSubview:_label];
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleAction:)];
//        [_label addGestureRecognizer:tap];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        imageView.image = [UIImage imageNamed:@"cellBackgroundImage"];
        self.backgroundView = imageView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    
        
    }
    return self;
}
//-(void)handleAction:(UITapGestureRecognizer*)sender
//{
//    //最后在来一个self.controller  push 到相关页面.....
//    
//    UILabel *label = (UILabel*)[self viewWithTag:sender.view.tag];
//    switch (label.tag) {
//        case 0:
//            NSLog(@"省流量模式;");
//            break;
//         case 1:
//            NSLog(@"换肤;");
//            break;
//        case 2:
//            NSLog(@"淘宝");
//            break;
//        case 3:
//            NSLog(@"游戏");
//            break;
//        default:
//            break;
//    }
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
