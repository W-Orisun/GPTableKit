//
//  GPCustomTableRow.h
//  GPTableKit_Example
//
//  Created by Orisun on 2022/10/17.
//  Copyright © 2022 Orisun. All rights reserved.
//

@import GPTableKit;

NS_ASSUME_NONNULL_BEGIN

@interface GPCustomTableRow : GPTableRow

@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;

@end

@interface GPCustomTableRowCell : GPTableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;

@end

NS_ASSUME_NONNULL_END
