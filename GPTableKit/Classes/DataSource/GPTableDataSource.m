//
//  GPTableDataSource.m
//  GPTableKit
//
//  Created by Orisun on 2022/10/12.
//

#import "GPTableDataSource.h"
#import "GPTableSection.h"
#import "GPTableRow.h"
#import "NSArray+GPUtil.h"

@implementation GPTableDataSource

- (void)addSection:(GPTableSection *)section {
    if ([section isKindOfClass:[GPTableSection class]]) {
        [self addChild:section];
    }
}

- (void)addSections:(NSArray<GPTableSection *> *)sections {
    [sections enumerateObjectsUsingBlock:^(GPTableSection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addSection:obj];
    }];
}

- (NSArray *)allSections {
    return [self children];
}

- (NSArray *)allRows {
    NSMutableArray *array = [NSMutableArray array];
    [[self allSections] enumerateObjectsUsingBlock:^(GPTableSection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObjectsFromArray:[obj allRows]];
    }];
    return array;
}

- (GPTableSection *)sectionAtIndex:(NSUInteger)index {
    return [[self allSections] safeObjectAtIndex:index];
}

- (GPTableRow *)rowAtIndexPath:(NSIndexPath *)indexPath {
    GPTableSection *section = [self sectionAtIndex:indexPath.section];
    return [[section allRows] safeObjectAtIndex:indexPath.row];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self allSections].count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self sectionAtIndex:section] allRows].count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GPTableRow *row = [self rowAtIndexPath:indexPath];
    row.tableView = tableView;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[row reuseIdentifier]];
    if (!cell) {
        cell = [row createNewTableViewCellForRow];
    }
    if (cell) {
        [row updateCell:cell indexPath:indexPath];
    }
    return cell;
}

@end
