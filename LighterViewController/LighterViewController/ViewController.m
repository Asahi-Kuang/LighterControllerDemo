//
//  ViewController.m
//  LighterViewController
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/3.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

static NSString *const reuseIdentifier = @"reuseIdentifier";
@interface ViewController ()<UITableViewDelegate>

@property(nonatomic, strong) UITableView *tempTableView;
@property(nonatomic, strong) TableDataSource *tds;
@property(nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController
@synthesize tempTableView, tds;

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createUI];
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Lazy loading
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark - methods
- (void)createUI {
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    // 导航栏标题
    UILabel *navTitle = [[UILabel alloc] initWithFrame:RECT_MAKE(0, 0, 100, 70)];
    [navTitle setText:@"轻便的ViewController"];
    [navTitle setTextAlignment:NSTextAlignmentCenter];
    [navTitle setTextColor:[UIColor whiteColor]];
    [navTitle setFont:[UIFont boldSystemFontOfSize:20.f]];
    [self.navigationItem setTitleView:navTitle];
}

- (void)createTableView {
    tempTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [tempTableView setTableFooterView:[UIView new]];
    [tempTableView setDelegate:self];
    [tempTableView setBackgroundColor:COLOR(244, 244, 244, 1)];
    self.view = tempTableView;
    
    cellConfigureBlock cellBlock = ^(UITableViewCell *cell, NSString *item) {
        [cell.textLabel setText:item];
    };
    NSArray *dataArray = [NSArray arrayWithObjects:@"Objective-C", @"Swift", @"CSS", @"Python", @"Javascript", @"HTML5", @"PHP", nil];
    [self.dataArray addObjectsFromArray:dataArray];
    tds = [[TableDataSource alloc] initWithItems:self.dataArray withReuseIdentifier:reuseIdentifier withCellConfigureBlock:cellBlock withSystemCell:YES];
    [tempTableView setDataSource:tds];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    SecondViewController *sVC = [[SecondViewController alloc] init];
    [sVC setTitleStr:self.dataArray[indexPath.row]];
    [self.navigationController pushViewController:sVC animated:YES];
    
}
@end
