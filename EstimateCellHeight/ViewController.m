//
//  ViewController.m
//  EstimateCellHeight
//
//  Created by Mag1cPanda on 16/4/20.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "ViewController.h"
#import "RJModel.h"
#import "TestTableViewCell.h"

//static NSString *cellId = @"cellId";

@interface ViewController ()
<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table;
    RJModel *model;
    BOOL isInsertingRow;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    model = [[RJModel alloc] init];
    [model populateDataSource];
    
    table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    table.estimatedRowHeight = UITableViewAutomaticDimension;
    table.allowsSelection = NO;
    [self.view addSubview:table];
    
    [table registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:nil] forCellReuseIdentifier:@"TestTableViewCell"];
    
    self.title = @"Auto Layout Table View";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(clear:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRow:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 导航栏点击事件
- (void)clear:(id)sender
{
    NSMutableArray *rowsToDelete = [NSMutableArray new];
    for (NSUInteger i = 0; i < [model.dataSource count]; i++) {
        [rowsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    }
    
    model = [[RJModel alloc] init];
    
    [table deleteRowsAtIndexPaths:rowsToDelete withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [table reloadData];
}

- (void)addRow:(id)sender
{
    [model addSingleItemToDataSource];
    
    isInsertingRow = YES;
    
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:[model.dataSource count] - 1 inSection:0];
    [table insertRowsAtIndexPaths:@[lastIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    isInsertingRow = NO;
}

#pragma mark - table Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return model.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestTableViewCell"];
    
    NSDictionary *dataSourceItem = model.dataSource[indexPath.row];
    cell.lab1.text = dataSourceItem[@"title"];
    cell.lab2.text = dataSourceItem[@"body"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}


@end
