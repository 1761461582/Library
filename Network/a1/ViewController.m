//
//  ViewController.m
//  a1
//
//  Created by hy on 15/7/28.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "ViewController.h"
#import "MovieListAPI.h"

@interface ViewController ()<RTAPIManagerApiCallBackDelegate,RTAPIManagerValidator>
@property (nonatomic,strong) MovieListAPI *movieListWebAPI;
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
    [self.movieListWebAPI loadData];
}

#pragma - mark RTAPIManagerApiCallBackDelegate
- (void)managerCallAPIDidSuccess:(RTAPIBaseManager *)manager
{
    NSLog(@"Successfully");
    NSDictionary *data = [manager fetchDataWithReformer:nil];
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

-(MovieListAPI*)movieListWebAPI
{
    if (_movieListWebAPI == nil) {
        _movieListWebAPI = [[MovieListAPI alloc] init];
        _movieListWebAPI.delegate = self;
        _movieListWebAPI.validator = self;
    }
    return _movieListWebAPI;
}


@end
