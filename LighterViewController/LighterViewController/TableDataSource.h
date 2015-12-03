//
//  TableDataSource.h
//  LighterViewController
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/3.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^cellConfigureBlock)(id cell, id item);
@interface TableDataSource : UIViewController<UITableViewDataSource>


- (id)objectAtIndexPath:(NSIndexPath *)indexPath;

// 构造方法
- (instancetype)initWithItems:(NSArray *)items
          withReuseIdentifier:(NSString *)identifier
       withCellConfigureBlock:(cellConfigureBlock)block withSystemCell:(BOOL)isSystemCell;

@end
