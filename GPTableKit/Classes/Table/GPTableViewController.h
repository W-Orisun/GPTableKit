//
//  GPTableViewController.h
//  GPTableKit
//
//  Created by Orisun on 2022/10/13.
//

#import <UIKit/UIKit.h>
#import "GPTableView.h"
#import "GPTableDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface GPTableViewController : UIViewController <UITableViewDelegate>

@property (nonatomic, strong) GPTableView *tableView;
@property (nonatomic, assign) UITableViewStyle tableViewStyle; //在viewDidLoad前设置生效
@property (nonatomic, strong) GPTableDataSource *dataSource;

@end

NS_ASSUME_NONNULL_END
