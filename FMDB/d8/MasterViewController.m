//
//  MasterViewController.m
//  d8
//
//  Created by hy on 15/7/24.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "TimelineMgr.h"

@interface MasterViewController ()

@property (nonatomic,strong) NSMutableArray *objects;
@property (nonatomic,strong) TimelineMgr *timelineMgr;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    NSArray *array = [self.timelineMgr GetTimelineList];
    for ( int i = 0; i < [array count]; i++) {
        NSDictionary *dic = [array objectAtIndex:i];
        NSDate *date = [dic valueForKey:@"Timeline"];
        [self.objects addObject:date];
    }
    
    //[self.objects addObjectsFromArray:[self.timelineMgr GetTimelineList]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
//    if (!self.objects) {
//        self.objects = [[NSMutableArray alloc] init];
//    }
    NSDate *date = [NSDate date];
    //[self.objects insertObject:[NSDate date] atIndex:0];
    [self.objects insertObject:date atIndex:0];
    
    [self.timelineMgr AddTimelineObject:date];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(TimelineMgr*)timelineMgr
{
    if (_timelineMgr == nil) {
        _timelineMgr = [[TimelineMgr alloc]init];
        [_timelineMgr InitMgr];
    }
    return _timelineMgr;
}

-(NSMutableArray*)objects
{
    if (_objects == nil) {
        _objects = [[NSMutableArray alloc] init];
    }
    return _objects;
}

@end
