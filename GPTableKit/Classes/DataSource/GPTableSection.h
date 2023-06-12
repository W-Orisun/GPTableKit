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
/// Default is CGFLOAT_MIN returned in (tableView:heightForHeaderInSection:)
@property (nonatomic, assign) CGFloat headerHeight;
/// Default is CGFLOAT_MIN returned in (tableView:heightForFooterInSection:)
@property (nonatomic, assign) CGFloat footerHeight;

- (NSUInteger)section;

- (void)addRow:(GPTableRow *)row;
- (void)addRows:(NSArray<GPTableRow *> *)rows;

- (NSArray<GPTableRow *> *)allRows;
- (void)setAllRows:(NSArray<GPTableRow *> *)rows;
- (nullable GPTableRow *)rowAtIndex:(NSUInteger)index;

- (BOOL)autoAdjustHeaderHeight;
- (BOOL)autoAdjustFooterHeight;
- (nullable UITableViewHeaderFooterView *)tableView:(GPTableView *)tableView viewForHeaderInSection:(NSInteger)section;
- (nullable UITableViewHeaderFooterView *)tableView:(GPTableView *)tableView viewForFooterInSection:(NSInteger)section;
- (CGFloat)tableView:(GPTableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)tableView:(GPTableView *)tableView heightForFooterInSection:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
