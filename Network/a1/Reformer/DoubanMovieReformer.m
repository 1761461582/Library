//
//  DoubanMovieReformer.m
//  a1
//
//  Created by hy on 15/8/1.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "DoubanMovieReformer.h"
#import "MovieListAPI.h"
#import "MovieItem.h"

NSString * const kPropertyListDataMovieName = @"kPropertyListDataMovieName";
NSString * const kPropertyListDataMovieYear = @"kPropertyListDataMovieYear";

@implementation DoubanMovieReformer

-(id) manager:(RTAPIBaseManager *)manager reformData:(NSDictionary *)data
{
    //NSDictionary *resultData = nil;
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    if ([manager isKindOfClass:[MovieListAPI class]]) {
        
        NSArray *array = [data objectForKey:@"subjects"];
        for(NSDictionary *dic in array)
        {
            MovieItem *it = [[MovieItem alloc]init];
            it.ID = [dic objectForKey:@"id"];
            it.title = [dic objectForKey:@"title"];
            it.original_title = [dic objectForKey:@"original_title"];
            it.year = [dic objectForKey:@"year"];
            
            NSDictionary *imgDic = [dic objectForKey:@"images"];
            it.postImageURL = [imgDic objectForKey:@"small"];
            NSDictionary *rateDic = [dic objectForKey:@"rating"];
            it.ratingString = [NSString stringWithFormat:@"%.1f", [[rateDic objectForKey:@"average"] floatValue]];
            NSArray *genres = [dic objectForKey:@"genres"];
            it.genres = [NSString stringWithFormat:@"%@,%@",[genres objectAtIndex:0],[genres objectAtIndex:1]];
            
            NSLog(@"ID is %@",it.ID);
            NSLog(@"title is %@",it.title);
            NSLog(@"original_title is %@",it.original_title);
            NSLog(@"year is %@",it.year);
            NSLog(@"postImageURL is %@",it.postImageURL);
            NSLog(@"ratingString is %@",it.ratingString);
            NSLog(@"genres is %@",it.genres);
            
            [result addObject:it];
        }
        
        
        /*resultData = @{
                       kPropertyListDataMovieName:data[@"title"],
                       kPropertyListDataMovieYear:data[@"total"]
                       };
         */
    }
    
    
    //return resultData;
    return result;
}

@end
