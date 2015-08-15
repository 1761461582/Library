//
//  DoubanMovieSearchResultByJSONModelReformer.m
//  a1
//
//  Created by hy on 15/8/15.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "DoubanMovieSearchResultByJSONModelReformer.h"
#import "MovieSearchWebAPI.h"
#import "MovieSearchResultByJSONModel.h"

@implementation DoubanMovieSearchResultByJSONModelReformer
-(id) manager:(RTAPIBaseManager *)manager reformData:(NSDictionary *)data
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    if ([manager isKindOfClass:[MovieSearchWebAPI class]]) {
        NSError* err = nil;
        MovieSearchResultByJSONModel *it = [[MovieSearchResultByJSONModel alloc]initWithString:[self DataTOjsonString:data] error:&err];
        
        [result addObjectsFromArray:it.subjects];
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
    NSLog(@"%@",jsonString);
    return jsonString;
}

@end
