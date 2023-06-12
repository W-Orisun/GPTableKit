//
//  GPViewController.m
//  GPTableKit
//
//  Created by Orisun on 10/17/2022.
//  Copyright (c) 2022 Orisun. All rights reserved.
//

#import "GPViewController.h"
#import "CustomSection.h"
#import "CustomRow.h"

@interface GPViewController ()

@end

@implementation GPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"GPTableKit Demo";
    
    CustomSection *section = [[CustomSection alloc] init];
    [self.dataSource addSection:section];
    for (NSInteger i = 1; i <= 30; i++) {
        CustomRow *row = [[CustomRow alloc] init];
        [section addRow:row];
    }
    
    [self.tableView reloadData];
}

@end
