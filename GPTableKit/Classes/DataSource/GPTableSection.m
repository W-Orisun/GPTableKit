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

- (UITableViewHeaderFooterView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UITableViewHeaderFooterView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section {
    
}

@end
