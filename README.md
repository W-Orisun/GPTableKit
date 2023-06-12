# GPTableKit

Manage tableView using sections and rows.

## Example

### ViewController

`GPTableDataSource` => `GPTableSection` => `GPTableRow` and `GPTableViewCell`

```objc
@implementation SubclassFromGPTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SubclassFromGPTableSection *section = [[SubclassFromGPTableSection alloc] init];
    [self.dataSource addSection:section];
    
    for (NSInteger i = 1; i <= 30; i++) {
        SubclassFromGPTableRow *row = [[SubclassFromGPTableRow alloc] init];
        [section addRow:row];
    }
    
    [self.tableView reloadData];
}

@end
```

### Section

Just use `GPTableSection` without header and footer.

```objc
@implementation SubclassFromGPTableSection

- (UITableViewHeaderFooterView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ...
}

- (CGFloat)headerHeight {
    return 20;
}

// use 'autoAdjustHeaderHeight' instead of 'headerHeight' for autoLayout
- (BOOL)autoAdjustHeaderHeight {
    return YES;
}

@end
```

### Row

```objc
@interface SubclassFromGPTableRow : GPTableRow
@property (nonatomic, copy) NSString *title;
...
@end

@implementation CustomRow

- (void)updateCell:(SubclassFromGPTableRowCell *)cell indexPath:(NSIndexPath *)indexPath {
    [super updateCell:cell indexPath:indexPath];
    cell.titleLabel.text = self.title;
    ...
        
	//select
    self.selectedBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
    	...
    };
}

- (CGFloat)cellHeight {
    return 50;
}

// use 'autoAdjustCellHeight' instead of 'cellHeight' for autoLayout
- (BOOL)autoAdjustCellHeight {
    return YES;
}

@end
```

### RowCell

Must name subclass with 'XXXRowCell'.

```objc
@interface SubclassFromGPTableRowCell : GPTableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
...
@end

@implementation SubclassFromGPTableRowCell

- (void)cellDidCreate {
    [super cellDidCreate];
    self.titleLabel = [[UILabel alloc] init];
    ...
}

@end
```

## Requirements

- iOS 10.0+
- Swift 5.4+

## Installation

GPTableKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GPTableKit'
```

## Author

Orisun, wdyang13@163.com

## License

GPTableKit is available under the MIT license. See the LICENSE file for more info.
