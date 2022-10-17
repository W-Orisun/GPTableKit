//
//  GPViewController.m
//  GPTableKit
//
//  Created by Orisun on 10/17/2022.
//  Copyright (c) 2022 Orisun. All rights reserved.
//

#import "GPViewController.h"
#import "GPCustomTableSection.h"
#import "GPCustomTableRow.h"

@interface GPViewController ()

@end

@implementation GPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"GPTableKit Demo";
    
    for (NSInteger i = 0; i < 10; i++) {
        GPCustomTableSection *section = [[GPCustomTableSection alloc] init];
        [self.dataSource addSection:section];
        for (NSInteger j = 0; j < 10; j++) {
            GPCustomTableRow *row = [[GPCustomTableRow alloc] init];
            row.title = [NSString stringWithFormat:@"联系人 %@", [NSNumber numberWithInteger:j]];
            row.subtitle = [NSString stringWithFormat:@"联系电话 18800001234"];
            row.selectedBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                NSLog(@"click at (%@, %@)", [NSNumber numberWithInteger:indexPath.section], [NSNumber numberWithInteger:indexPath.row]);
            };
            [section addRow:row];
        }
    }
    [self.tableView reloadData];
}

@end
