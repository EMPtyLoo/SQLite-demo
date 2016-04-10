//
//  SQLTool.h
//  sql3
//
//  Created by EMPty on 4/10/16.
//  Copyright (c) 2016 EMPty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Model.h"
#import <FMDB.h>
@interface SQLTool : NSObject
+ (void)initDB;
+ (void)addModel:(Model* )model;
+ (NSArray*) models;

@end
