//
//  ViewController.m
//  a1
//
//  Created by hy on 15/7/28.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "ViewController.h"
#import "MovieListAPI.h"
#import "DoubanMovieReformer.h"

#import "MovieListController.h"
#import "MovieSearchVC.h"


@interface ViewController ()<RTAPIManagerApiCallBackDelegate,RTAPIManagerValidator,RTAPIManagerParamSourceDelegate>
@property (nonatomic,strong) MovieListAPI *movieListWebAPI;
@property (nonatomic,strong) id<RTAPIManagerCallbackDataReformer> movieReformer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getMovieList:(id)sender {
    //[self.movieListWebAPI loadData];
    MovieListController *vc = [[MovieListController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)SearchMovie:(id)sender {
    MovieSearchVC *vc = [[MovieSearchVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma - mark RTAPIManagerApiCallBackDelegate
- (void)managerCallAPIDidSuccess:(RTAPIBaseManager *)manager
{
    NSLog(@"Successfully");
    NSDictionary *data = [manager fetchDataWithReformer:nil];
    //NSDictionary *data = [manager fetchDataWithReformer:self.movieReformer];
    NSLog(@"%@", data);
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
        param =   @{@"start":@"3",
                    @"count":@"1"};
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
        _movieReformer = [[DoubanMovieReformer alloc] init];
    }
    return _movieReformer;
}


@end
