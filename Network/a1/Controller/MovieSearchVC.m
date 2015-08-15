//
//  MovieSearchVC.m
//  a1
//
//  Created by hy on 15/8/15.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "MovieSearchVC.h"
#import "MovieSearchWebAPI.h"
#import "DoubanMovieSearchResultByJSONModelReformer.h"
#import "Subjects.h"
#import "MovieDetailVC.h"

@interface MovieSearchVC ()<RTAPIManagerApiCallBackDelegate,RTAPIManagerValidator,RTAPIManagerParamSourceDelegate>
@property (nonatomic,strong) MovieSearchWebAPI *movieSearchWebAPI;
@property (nonatomic, strong) NSMutableArray *movieSearchResultSource;
@property (nonatomic,strong) id<RTAPIManagerCallbackDataReformer> movieSearchResultReformer;
@end

@implementation MovieSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self requestSearchMovies];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark RTAPIManagerApiCallBackDelegate
- (void)managerCallAPIDidSuccess:(RTAPIBaseManager *)manager
{
    NSLog(@"Successfully");
    //NSDictionary *data = [manager fetchDataWithReformer:nil];

    NSArray *data = [manager fetchDataWithReformer:self.movieSearchResultReformer];
    
    [self.movieSearchResultSource addObjectsFromArray:data];

    [self.tableView reloadData];
}


- (void)managerCallAPIDidFailed:(RTAPIBaseManager *)manager
{
    NSLog(@"Fail");
}

#pragma - mark RTAPIManagerValidator
- (BOOL)manager:(RTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data
{
    return TRUE;
}

- (BOOL)manager:(RTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
{
    return TRUE;
}

#pragma - mark RTAPIManagerParamSourceDelegate
- (NSDictionary*)paramsForApi:(RTAPIBaseManager *)manager
{
    NSDictionary *param = nil;
    
    if ([manager isKindOfClass:[MovieSearchWebAPI class]]) {
        param =   @{@"q":@"汤唯",
                    @"count":@"10"};
    }
    
    return param;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.movieSearchResultSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"SEARCHCELL";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    Subjects *it = [self.movieSearchResultSource objectAtIndex:[indexPath row]];
    cell.textLabel.text = it.title;
    cell.detailTextLabel.text = it.original_title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    MovieDetailVC *vc = [[MovieDetailVC alloc] init];
    
    Subjects *it = [self.movieSearchResultSource objectAtIndex:[indexPath row]];
    [vc setMovieID:it.id];
    [self.navigationController pushViewController:vc animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma private
- (void)requestSearchMovies
{
    [self.movieSearchWebAPI loadData];
}


#pragma getter
-(MovieSearchWebAPI*)movieSearchWebAPI
{
    if (_movieSearchWebAPI == nil) {
        _movieSearchWebAPI = [[MovieSearchWebAPI alloc] init];
        _movieSearchWebAPI.delegate = self;
        _movieSearchWebAPI.validator = self;
        _movieSearchWebAPI.paramSource = self;
    }
    return _movieSearchWebAPI;
}

- (NSMutableArray*)movieSearchResultSource
{
    if (_movieSearchResultSource == nil) {
        _movieSearchResultSource = [[NSMutableArray alloc] init];
    }
    return _movieSearchResultSource;
}

-(id<RTAPIManagerCallbackDataReformer>)movieSearchResultReformer
{
    if (_movieSearchResultReformer == nil) {
        _movieSearchResultReformer = [[DoubanMovieSearchResultByJSONModelReformer alloc] init];
    }
    return _movieSearchResultReformer;
}

@end
