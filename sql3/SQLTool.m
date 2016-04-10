//
//  SQLTool.m
//  sql3
//
//  Created by EMPty on 4/10/16.
//  Copyright (c) 2016 EMPty. All rights reserved.
//

#import "SQLTool.h"

@implementation SQLTool
static FMDatabase* _db;
+ (void)initDB
{
    //1.打开数据库
    NSString* path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"db.sqlite"];
    
    _db = [FMDatabase databaseWithPath:path];
    [_db open];
    //2.创建表格
    [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS A (id integer PRIMARY KEY,name text NOT NULL,price real)"];
    
    
    
    
}

+ (void)addModel:(Model* )model
{
    [_db executeUpdateWithFormat:@"INSERT INTO A(name,price) VALUES (%@,%@);",model.name,model.price];
}

+ (NSArray*) models
{
    //得到结果集
    FMResultSet* set = [_db executeQuery:@"SELECT * FROM A"];
    
    //不断往下取数据
    NSMutableArray* models = [NSMutableArray array];
    while (set.next) {
        //获得当前所指向的数据
        Model* temp = [[Model alloc]init];
        temp.price = [set stringForColumn:@"price"];
        temp.name = [set stringForColumn:@"name"];
        [models addObject:temp];
    }
    
    return models;
    
    
}


@end
