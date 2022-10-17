//
//  GPTableSection.m
//  GPTableKit
//
//  Created by Orisun on 2022/10/12.
//

#import "GPTableSection.h"
#import "GPTableRow.h"
#import "NSArray+GPUtil.h"

@implementation GPTableSection

- (NSUInteger)section {
    return [self nodeIndex];
}

- (void)addRow:(GPTableRow *)row {
    if ([row isKindOfClass:[GPTableRow class]]) {
        [self addChild:row];
    }
}

- (void)addRows:(NSArray<GPTableRow *> *)rows {
    [rows enumerateObjectsUsingBlock:^(GPTableRow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addRow:obj];
    }];
}

- (NSArray *)allRows {
    return [self children];
}

- (void)setAllRows:(NSArray<GPTableRow *> *)rows {
    [self setChildren:rows];
}

- (GPTableRow *)rowAtIndex:(NSUInteger)index {
    return (GPTableRow *)[[self children] safeObjectAtIndex:index];
}

#pragma mark - header & footer
- (BOOL)autoAdjustHeaderFooterHeight {
    return NO;
}

- (UITableViewHeaderFooterView *)tableView:(GPTableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UITableViewHeaderFooterView *)tableView:(GPTableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(GPTableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(GPTableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

@end
