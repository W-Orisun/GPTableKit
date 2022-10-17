//
//  GPTableDataSource.h
//  GPTableKit
//
//  Created by Orisun on 2022/10/12.
//

#import "GPNode.h"

NS_ASSUME_NONNULL_BEGIN

@class GPTableSection;
@class GPTableRow;

@interface GPTableDataSource : GPNode <UITableViewDataSource>

- (void)addSection:(GPTableSection *)section;
- (void)addSections:(NSArray<GPTableSection *> *)sections;

- (NSArray<GPTableSection *> *)allSections;
- (NSArray<GPTableRow *> *)allRows;

- (nullable GPTableSection *)sectionAtIndex:(NSUInteger)index;
- (nullable GPTableRow *)rowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
