//
//  GPTableViewCell.m
//  GPTableKit
//
//  Created by Orisun on 2022/10/14.
//

#import "GPTableViewCell.h"

@implementation GPTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self cellDidCreate];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self cellDidCreate];
}

- (void)cellDidCreate {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
