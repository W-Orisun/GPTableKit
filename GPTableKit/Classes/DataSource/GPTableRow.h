//
//  GPTableRow.h
//  GPTableKit
//
//  Created by Orisun on 2022/10/12.
//

#import "GPNode.h"

NS_ASSUME_NONNULL_BEGIN

@class GPTableView;
@class GPTableSection;

typedef void (^GPTableRowSelectedBlock)(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath);

@interface GPTableRow : GPNode

@property (nonatomic, weak, nullable) UITableView *tableView;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGFloat estimatedHeight; //默认44
@property (nonatomic, strong, nullable) GPTableRowSelectedBlock selectedBlock;

/// 默认为NSStringFromClass([self class])
- (NSString *)reuseIdentifier;
- (nullable NSIndexPath *)indexPath;
/// 是否自动计算cell高度，默认NO
- (BOOL)autoAdjustCellHeight;
/// 默认创建"[self class]Cell"为类名的cell，不存在时需要重写
- (UITableViewCell *)createNewTableViewCellForRow;
/// 需要子类重写去更新cell，会在cellForRowAtIndexPath调用
- (void)updateCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
