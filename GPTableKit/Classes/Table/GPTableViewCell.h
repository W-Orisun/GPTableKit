//
//  GPTableViewCell.h
//  GPTableKit
//
//  Created by Orisun on 2022/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 配合GPTableRow使用，子类命名为XXXRowCell，可以让TableRow自动创建对应Cell
@interface GPTableViewCell : UITableViewCell

/// 在Cell创建后调用，子类继承时需要调用super
- (void)cellDidCreate NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
