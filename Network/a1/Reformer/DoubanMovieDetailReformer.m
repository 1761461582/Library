//
//  DoubanMovieDetailReformer.m
//  a1
//
//  Created by hy on 15/8/9.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "DoubanMovieDetailReformer.h"
#import "MovieDetailAPI.h"
#import "MovieDetailItem.h"

@implementation DoubanMovieDetailReformer
-(id) manager:(RTAPIBaseManager *)manager reformData:(NSDictionary *)data
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    if ([manager isKindOfClass:[MovieDetailAPI class]]) {
        
        MovieDetailItem *it = [[MovieDetailItem alloc]init];
        
        it.ID = [data objectForKey:@"id"];
        it.title = [data objectForKey:@"title"];
        it.original_title = [data objectForKey:@"original_title"];
        it.year = [data objectForKey:@"year"];
        it.summary = [data objectForKey:@"summary"];
        it.wish_count = [NSString stringWithFormat:@"%d",[[data objectForKey:@"wish_count"] intValue]];
        it.collect_count = [NSString stringWithFormat:@"%d",[[data objectForKey:@"collect_count"] intValue]];
        it.reviews_count = [NSString stringWithFormat:@"%d",[[data objectForKey:@"reviews_count"] intValue]];
        
        NSDictionary *imgDic = [data objectForKey:@"images"];
        it.postImageURL = [imgDic objectForKey:@"large"];
        NSDictionary *rateDic = [data objectForKey:@"rating"];
        it.ratingString = [NSString stringWithFormat:@"%.1f", [[rateDic objectForKey:@"average"] floatValue]];
        NSArray *genres = [data objectForKey:@"genres"];
        it.genres = [NSString stringWithFormat:@"%@",[genres objectAtIndex:0]];
        
        NSArray *array = [data objectForKey:@"directors"];
        NSDictionary *directorinfo = [array objectAtIndex:0];
        it.directorName = [directorinfo objectForKey:@"name"];
        NSDictionary *director_img = [directorinfo objectForKey:@"avatars"];
        it.directorAvantarImgURL = [director_img objectForKey:@"large"];
            
        NSLog(@"ID is %@",it.ID);
        NSLog(@"title is %@",it.title);
        NSLog(@"original_title is %@",it.original_title);
        NSLog(@"year is %@",it.year);
        NSLog(@"summary is %@",it.summary);
        NSLog(@"wish_count is %@",it.wish_count);
        NSLog(@"collection_count is %@",it.collect_count);
        NSLog(@"review_count is %@",it.reviews_count);
        NSLog(@"director name is %@",it.directorName);
        NSLog(@"director's img is %@",it.directorAvantarImgURL);
        NSLog(@"postImageURL is %@",it.postImageURL);
        NSLog(@"ratingString is %@",it.ratingString);
      
            
        [result addObject:it];
    }

    return result;
}
@end
