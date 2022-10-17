//
//  GPCustomTableRow.m
//  GPTableKit_Example
//
//  Created by Orisun on 2022/10/17.
//  Copyright © 2022 Orisun. All rights reserved.
//

#import "GPCustomTableRow.h"

@implementation GPCustomTableRow

- (void)updateCell:(GPCustomTableRowCell *)cell indexPath:(NSIndexPath *)indexPath {
    [super updateCell:cell indexPath:indexPath];
    cell.titleLabel.text = self.title;
    cell.subtitleLabel.text = self.subtitle;
}

- (CGFloat)cellHeight {
    return 60;
}

@end


@implementation GPCustomTableRowCell

- (void)cellDidCreate {
    [super cellDidCreate];
    self.backgroundColor = UIColor.whiteColor;
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 8, 200, 20)];
    self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 32, 200, 20)];
    self.subtitleLabel.textColor = UIColor.lightGrayColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.subtitleLabel];
}

@end
