//
//  GPTableSection.h
//  GPTableKit
//
//  Created by Orisun on 2022/10/12.
//

#import "GPNode.h"

NS_ASSUME_NONNULL_BEGIN

@class GPTableView;
@class GPTableRow;

@interface GPTableSection : GPNode
/// Default is CGFLOAT_MIN
@property (nonatomic, assign) CGFloat headerHeight;
/// Default is CGFLOAT_MIN
@property (nonatomic, assign) CGFloat footerHeight;

- (NSUInteger)section;

- (void)addRow:(GPTableRow *)row;
- (void)addRows:(NSArray<GPTableRow *> *)rows;

- (NSArray<GPTableRow *> *)allRows;
- (void)setAllRows:(NSArray<GPTableRow *> *)rows;
- (nullable GPTableRow *)rowAtIndex:(NSUInteger)index;

- (BOOL)autoAdjustHeaderHeight;
- (BOOL)autoAdjustFooterHeight;

// delegate for override
- (nullable UITableViewHeaderFooterView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
- (nullable UITableViewHeaderFooterView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section;
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section;
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section;
- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
