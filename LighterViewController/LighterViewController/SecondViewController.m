//
//  SecondViewController.m
//  LighterViewController
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/3.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#import "SecondViewController.h"
#import "KQXTableViewCell.h"

static NSString *const reuseIdentifier = @"identifier";
@interface SecondViewController ()<UITableViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) TableDataSource *tds;
@end

@implementation SecondViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    [self setUpTableView];
    
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"KQXTableViewCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - createUI
- (void)createUI {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UILabel *titleLb = [[UILabel alloc] initWithFrame:RECT_MAKE(0, 0, 100, 40)];
    [titleLb setText:_titleStr];
    [titleLb setTextColor:[UIColor whiteColor]];
    [titleLb setTextAlignment:NSTextAlignmentCenter];
    [titleLb setFont:[UIFont boldSystemFontOfSize:20.f]];
    [self.navigationItem setTitleView:titleLb];
}

- (void)setUpTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [_tableView setTableFooterView:[UIView new]];
    [_tableView setDelegate:self];
    self.view = _tableView;
    cellConfigureBlock cellBlock = ^(KQXTableViewCell *cell, NSString *item) {
        [cell.displayLb setText:item];
    };
    NSArray *data = [NSArray arrayWithObjects: _titleStr, _titleStr, _titleStr, nil];
    _tds = [[TableDataSource alloc] initWithItems:data withReuseIdentifier:reuseIdentifier withCellConfigureBlock:cellBlock withSystemCell:NO];
    [_tableView setDataSource:_tds];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 113.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
