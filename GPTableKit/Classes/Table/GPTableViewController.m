//
//  GPTableViewController.m
//  GPTableKit
//
//  Created by Orisun on 2022/10/13.
//

#import "GPTableViewController.h"

@interface GPTableViewController ()

@end

@implementation GPTableViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tableViewStyle = UITableViewStyleGrouped;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.tableViewStyle = UITableViewStyleGrouped;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
}

- (void)initTableView {
    self.tableView = [[GPTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:self.tableViewStyle];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataSource = [[GPTableDataSource alloc] init];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
}

@end
