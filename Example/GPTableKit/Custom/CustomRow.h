//
//  CustomRow.h
//  GPTableKit_Example
//
//  Created by Orisun on 2023/6/12.
//  Copyright © 2023 Orisun. All rights reserved.
//

@import GPTableKit;

NS_ASSUME_NONNULL_BEGIN

@interface CustomRow : GPTableRow
@property (nonatomic, assign) BOOL isSelected;
@end

@interface CustomRowCell : GPTableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@end

NS_ASSUME_NONNULL_END
