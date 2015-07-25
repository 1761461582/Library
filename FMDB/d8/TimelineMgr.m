//
//  TimelineMgr.m
//  d8
//
//  Created by hy on 15/7/24.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "TimelineMgr.h"
#import "FMDB.h"
@interface TimelineMgr()
{
    FMDatabase *database;
}
@end

@implementation TimelineMgr

-(BOOL)InitMgr
{
    [self openDB:@"studentDetail.db"];
    return TRUE;
}

-(BOOL)AddTimelineObject:(NSDate *)object
{
    NSString *sql = [NSString stringWithFormat:@"insert into Timeline (Timeline) values (\"%@\")",[NSDate date]];
    [self executeNonSQL:sql];
    return TRUE;
}

-(NSArray*)GetTimelineList
{
    NSString *sql = [NSString stringWithFormat:@"select * from Timeline"];
    NSArray *data = [self executeQuery:sql];
    
    return data;
}

- (void)CreateTable {
    [self executeNonSQL:@"create table if not exists Timeline (Timeline double)"];
    
}

-(NSArray*)executeQuery:(NSString*)sql
{
    NSMutableArray *result = [NSMutableArray array];
    
    FMResultSet *set = [database executeQuery:sql];
    while (set.next) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        for (int i=0; i<set.columnCount; i++) {
            dic[[set columnNameForIndex:i]] = [set stringForColumnIndex:i];
        }
        
        [result addObject:dic];
    }
    
    return result;
}

-(void)executeNonSQL:(NSString *)sql
{
    if ([database executeUpdate:sql]) {
        NSLog(@"Database execute SQL = %@",sql);
    }
    else
    {
        NSLog(@"Database fail to execute SQL = %@",sql);
    }
}

-(void)openDB:(NSString*)dbName
{
    //NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSArray *directory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbPath = [directory objectAtIndex:0];
    NSString *dbFullName = [dbPath stringByAppendingPathComponent:dbName];
    NSLog(@"The database full path is %@",dbFullName);
    
    BOOL existTable = FALSE;
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if ([fileMgr fileExistsAtPath:dbFullName]) {
        existTable = TRUE;
    }else
    {
        existTable = FALSE;
    }
    
    database = [FMDatabase databaseWithPath:dbFullName];
    if ([database open]) {
        NSLog(@"Database is accessed successfully");
    }else
    {
        NSLog(@"Database is Failed to access");
    }
    
    if (!existTable) {
       [self CreateTable];
    }
}

@end
