//
//  DoubanMovieSearchResultByJSONModelReformer.m
//  a1
//
//  Created by hy on 15/8/15.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "DoubanTopMovieItemByJSONModelReformer.h"
#import "MovieListAPI.h"
#import "TopMovieItemByJSONModel.h"

@implementation DoubanTopMovieItemByJSONModelReformer
-(id) manager:(RTAPIBaseManager *)manager reformData:(NSDictionary *)data
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    if ([manager isKindOfClass:[MovieListAPI class]]) {
        NSError* err = nil;
        TopMovieItemByJSONModel *it = [[TopMovieItemByJSONModel alloc]initWithString:[self DataTOjsonString:data] error:&err];
        
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
