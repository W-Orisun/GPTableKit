//
//  CustomSection.m
//  GPTableKit_Example
//
//  Created by Orisun on 2023/6/12.
//  Copyright © 2023 Orisun. All rights reserved.
//

#import "CustomSection.h"

@implementation CustomSection

- (UITableViewHeaderFooterView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:nil];
    UILabel *label = [[UILabel alloc] init];
    label.textColor = UIColor.lightGrayColor;
    label.text = @"#";
    [view addSubview:label];
    label.frame = CGRectMake(16, 5, 100, 20);
    return view;
}

- (CGFloat)headerHeight {
    return 30;
}

@end
