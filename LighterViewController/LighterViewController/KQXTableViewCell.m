//
//  KQXTableViewCell.m
//  LighterViewController
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/3.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#import "KQXTableViewCell.h"

@implementation KQXTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.displayLb setBackgroundColor:COLOR(78, 44, 63, 1)];
    [self.displayLb.layer setMasksToBounds:YES];
    [self.displayLb.layer setCornerRadius:10.f];
    [self.displayLb setFont:[UIFont boldSystemFontOfSize:17.f]];
    [self.displayLb setTextColor:COLOR(153, 0, 77, 1)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
