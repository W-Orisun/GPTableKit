//
//  CustomRow.m
//  GPTableKit_Example
//
//  Created by Orisun on 2023/6/12.
//  Copyright © 2023 Orisun. All rights reserved.
//

#import "CustomRow.h"

@implementation CustomRow

- (void)updateCell:(CustomRowCell *)cell indexPath:(NSIndexPath *)indexPath {
    [super updateCell:cell indexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    cell.titleLabel.textColor = self.isSelected ? UIColor.redColor : UIColor.blackColor;
    
    __weak typeof(self) weakSelf = self;
    self.selectedBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.isSelected = !strongSelf.isSelected;
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    };
}

- (CGFloat)cellHeight {
    return 50;
}

@end


@implementation CustomRowCell

- (void)cellDidCreate {
    [super cellDidCreate];
    self.backgroundColor = UIColor.whiteColor;
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = UIColor.blackColor;
    
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.frame = CGRectMake(16, 15, 100, 20);
}

@end
