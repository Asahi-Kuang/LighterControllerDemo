//
//  TableDataSource.m
//  LighterViewController
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/3.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#import "TableDataSource.h"

@interface TableDataSource ()

@property (nonatomic, strong)NSArray *dataArray;
@property (nonatomic, copy)  NSString *reuseIdentifier;
@property (nonatomic, copy)  cellConfigureBlock cellBlock;
@property (nonatomic, assign)BOOL isCell_system;
@end

@implementation TableDataSource
@synthesize dataArray, reuseIdentifier, cellBlock, isCell_system;

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - methods complementation
- (instancetype)init {
    return nil;
}

- (instancetype)initWithItems:(NSArray *)items
          withReuseIdentifier:(NSString *)identifier
       withCellConfigureBlock:(cellConfigureBlock)block withSystemCell:(BOOL)isSystemCell{
    self = [super init];
    if (self) {
        dataArray = items;
        reuseIdentifier = identifier;
        cellBlock = block;
        isCell_system = isSystemCell;
    }
    return self;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath {
    return [dataArray objectAtIndex:(NSUInteger) indexPath.row];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self objectAtIndexPath:indexPath];

    if (isCell_system) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        }
        else {
            while ([cell.contentView.subviews lastObject]) {
                [[cell.contentView.subviews lastObject] removeFromSuperview];
            }
        }
        cellBlock(cell, item);
        return cell;
    }
    else {
        id cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
        cellBlock(cell, item);
        return cell;
    }
}

@end
