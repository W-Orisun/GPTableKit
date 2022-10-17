//
//  GPCustomTableSection.m
//  GPTableKit_Example
//
//  Created by Orisun on 2022/10/17.
//  Copyright © 2022 Orisun. All rights reserved.
//

#import "GPCustomTableSection.h"

@interface GPCustomTableSectionHeader : UITableViewHeaderFooterView
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation GPCustomTableSectionHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = UIColor.clearColor;
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 36)];
        self.titleLabel.backgroundColor = UIColor.lightGrayColor;
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

@end

@implementation GPCustomTableSection

- (UITableViewHeaderFooterView *)tableView:(GPTableView *)tableView viewForHeaderInSection:(NSInteger)section {
    GPCustomTableSectionHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([GPCustomTableSectionHeader class])];
    if (!header) {
        NSLog(@"new GPCustomTableSectionHeader at %@", [NSNumber numberWithInteger:section]);
        header = [[GPCustomTableSectionHeader alloc] initWithReuseIdentifier:NSStringFromClass([GPCustomTableSectionHeader class])];
    }
    header.titleLabel.text = [NSString stringWithFormat:@"   section %@", [NSNumber numberWithInteger:section]];
    return header;
}

- (CGFloat)tableView:(GPTableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 36;
}

@end

