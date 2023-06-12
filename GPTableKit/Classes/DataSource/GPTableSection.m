//
//  GPTableSection.m
//  GPTableKit
//
//  Created by Orisun on 2022/10/12.
//

#import "GPTableSection.h"
#import "GPTableRow.h"

@implementation GPTableSection

- (instancetype)init {
    self = [super init];
    if (self) {
        self.headerHeight = CGFLOAT_MIN;
        self.footerHeight = CGFLOAT_MIN;
    }
    return self;
}

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
    return (GPTableRow *)[[self children] gp_safeObjectAtIndex:index];
}

#pragma mark - header & footer
- (BOOL)autoAdjustHeaderHeight {
    return NO;
}

- (BOOL)autoAdjustFooterHeight {
    return NO;
}

- (UITableViewHeaderFooterView *)tableView:(GPTableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UITableViewHeaderFooterView *)tableView:(GPTableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(GPTableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.headerHeight;
}

- (CGFloat)tableView:(GPTableView *)tableView heightForFooterInSection:(NSInteger)section {
    return self.footerHeight;
}

@end
