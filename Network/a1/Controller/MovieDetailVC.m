//
//  MovieDetailVC.m
//  a1
//
//  Created by hy on 15/8/9.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "MovieDetailVC.h"
#import "../WebAPI/MovieDetailAPI.h"
#import "DoubanMovieDetailReformer.h"

#import "DoubanMovieReformerByJsonModel.h"

@interface MovieDetailVC ()<RTAPIManagerApiCallBackDelegate,RTAPIManagerValidator,RTAPIManagerParamSourceDelegate>
@property (nonatomic,strong) MovieDetailAPI *movieDetailWebAPI;
@property (nonatomic, strong) NSMutableArray *movieListSource;
@property (nonatomic,strong) id<RTAPIManagerCallbackDataReformer> movieDetailReformer;
@property (nonatomic,strong) id<RTAPIManagerCallbackDataReformer> movieReformerByJsonModel;
@end

@implementation MovieDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.movieDetailWebAPI loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setMovieID:(NSString *)movieID
{
    if (_movieID != movieID) {
        _movieID = movieID;
    }
}

#pragma - mark RTAPIManagerApiCallBackDelegate
- (void)managerCallAPIDidSuccess:(RTAPIBaseManager *)manager
{
    NSLog(@"Successfully");
    //返回 原始数据。 NSDictionary 格式
    //NSDictionary *data = [manager fetchDataWithReformer:nil];
    
    //返回 转换后格式，转换后的格式，由movieDetailReformer转换器决定
    //NSArray *data = [manager fetchDataWithReformer:self.movieDetailReformer];
    
    NSArray *data = [manager fetchDataWithReformer:self.movieReformerByJsonModel];
    
    
    NSLog(@"%@",data);

    //[self.movieListSource addObjectsFromArray:data];
    //self.movieListSource = data;
    //[self.tableView reloadData];
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
    
    if ([manager isKindOfClass:[MovieDetailAPI class]]) {
        param =   @{@"movieid":self.movieID
                    };
    }
    
    return param;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(MovieDetailAPI*)movieDetailWebAPI
{
    if (_movieDetailWebAPI == nil) {
        _movieDetailWebAPI = [[MovieDetailAPI alloc] init];
        _movieDetailWebAPI.delegate = self;
        _movieDetailWebAPI.validator = self;
        _movieDetailWebAPI.paramSource = self;
    }
    return _movieDetailWebAPI;
}

-(id<RTAPIManagerCallbackDataReformer>)movieDetailReformer
{
    if (_movieDetailReformer == nil) {
        _movieDetailReformer = [[DoubanMovieDetailReformer alloc] init];
    }
    return _movieDetailReformer;
}

-(id<RTAPIManagerCallbackDataReformer>)movieReformerByJsonModel
{
    if (_movieReformerByJsonModel == nil) {
        _movieReformerByJsonModel = [[DoubanMovieReformerByJsonModel alloc] init];
    }
    return _movieReformerByJsonModel;
}

@end
