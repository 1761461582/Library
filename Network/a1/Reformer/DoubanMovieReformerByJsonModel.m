//
//  DoubanMovieReformerByJsonModel.m
//  a1
//
//  Created by hy on 15/8/11.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "DoubanMovieReformerByJsonModel.h"
#import "MovieDetailAPI.h"
#import "MovieItemByJSONModel.h"

#import "JSONModel.h"

@implementation DoubanMovieReformerByJsonModel
-(id) manager:(RTAPIBaseManager *)manager reformData:(NSDictionary *)data
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    if ([manager isKindOfClass:[MovieDetailAPI class]]) {
        //以下2段代码等价。 一个是自己去解析。 一个是使用JSONModel（直接自动转换）
        NSError* err = nil;
        MovieItemByJSONModel *it = [[MovieItemByJSONModel alloc]initWithString:[self DataTOjsonString:data] error:&err];
        
        /*
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
        */

        
       
        NSLog(@"ID is %@",it.ID);
        NSLog(@"title is %@",it.title);
        NSLog(@"original_title is %@",it.original_title);
        NSLog(@"year is %@",it.year);
        NSLog(@"summary is %@",it.summary);
        NSLog(@"wish_count is %@",it.wish_count);
        NSLog(@"collection_count is %@",it.collect_count);
        NSLog(@"review_count is %@",it.reviews_count);
        NSLog(@"postImageURL is %@",it.postImageURL);
        NSLog(@"ratingString is %@",it.ratingString);
        
            [result addObject:it];
        }
        

 
    return result;
}


-(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
