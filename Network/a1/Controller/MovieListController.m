//
//  MovieListController.m
//  a1
//
//  Created by hy on 15/8/2.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "MovieListController.h"
#import "MovieListAPI.h"
//#import "DoubanMovieReformer.h"
#import "DoubanTopMovieItemByJSONModelReformer.h"
//#import "MovieItem.h"
#import "Subjects.h"
#import "MovieDetailVC.h"
#import "UIImageView+WebCache.h"

@interface MovieListController ()<RTAPIManagerApiCallBackDelegate,RTAPIManagerValidator,RTAPIManagerParamSourceDelegate>
@property (nonatomic,strong) MovieListAPI *movieListWebAPI;
@property (nonatomic,strong) id<RTAPIManagerCallbackDataReformer> movieReformer;
@property (nonatomic, strong) NSMutableArray *movieListSource;
@property (nonatomic, strong) UIRefreshControl* refreshController;

@end

@implementation MovieListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.refreshController addTarget:self action:@selector(refreshFeed) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshController];
    
    [self requestMovies];
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
    NSArray *data = [manager fetchDataWithReformer:self.movieReformer];

    [self.movieListSource addObjectsFromArray:data];
    //self.movieListSource = data;
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
    
    if ([manager isKindOfClass:[MovieListAPI class]]) {
        param =   @{@"start":@"0",
                    @"count":@"5"};
    }
    
    return param;
}



-(MovieListAPI*)movieListWebAPI
{
    if (_movieListWebAPI == nil) {
        _movieListWebAPI = [[MovieListAPI alloc] init];
        _movieListWebAPI.delegate = self;
        _movieListWebAPI.validator = self;
        _movieListWebAPI.paramSource = self;
    }
    return _movieListWebAPI;
}

-(id<RTAPIManagerCallbackDataReformer>)movieReformer
{
    if (_movieReformer == nil) {
        _movieReformer = [[DoubanTopMovieItemByJSONModelReformer alloc] init];
    }
    return _movieReformer;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.movieListSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        static NSString *CellIdentifier = @"Cell";
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleSubtitle
                    reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    /*
    MovieItem *it = [self.movieListSource objectAtIndex:[indexPath row]];
    cell.textLabel.text = it.title;
    cell.detailTextLabel.text = it.original_title;
     */
    Subjects *it = [self.movieListSource objectAtIndex:[indexPath row]];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:it.images.small] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.textLabel.text = it.title;
    //cell.detailTextLabel.text = it.original_title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    MovieDetailVC *vc = [[MovieDetailVC alloc] init];
    /*
    MovieItem *it = [self.movieListSource objectAtIndex:[indexPath row]];
    [vc setMovieID:it.ID];
    [self.navigationController pushViewController:vc animated:YES];
     */
    Subjects *it = [self.movieListSource objectAtIndex:[indexPath row]];
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

- (void)refreshFeed
{
    [self requestMovies];
}

- (void)requestMovies
{
    [self.movieListWebAPI loadData];
}

- (NSMutableArray*)movieListSource
{
    if (_movieListSource == nil) {
        _movieListSource = [[NSMutableArray alloc] init];
    }
    return _movieListSource;
}

- (UIRefreshControl*)refreshControl
{
    if (_refreshController == nil) {
        _refreshController = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        
    }
    return _refreshController;
}

@end
