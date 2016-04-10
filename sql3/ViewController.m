//
//  ViewController.m
//  sql3
//
//  Created by EMPty on 4/10/16.
//  Copyright (c) 2016 EMPty. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

#import "SQLTool.h"
@interface ViewController ()
//数据库实例对象
@property (nonatomic,assign) sqlite3* db;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [SQLTool initDB];
//    for (int i = 0; i < 10 ; ++i) {
//        Model* temp = [[Model alloc]init];
//        temp.name = [NSString stringWithFormat:@"一个%d",i];
//        temp.price = [NSString stringWithFormat:@"%d",arc4random()];
//    
//        [SQLTool addModel:temp];
//        
//    }
    
    NSArray* data = [SQLTool models];
    for (Model* temp in data) {
        NSLog(@"%@ --  %@",temp.name,temp.price);
    }
    
}

- (void)test
{
    //连接数据库
    NSString* parh = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"shujuku.sqlite"];
    //如果数据库文件不存在,系统会自动创建文件自动初始化
    //路径oc转c
    //创建数据库对象实体
    //    sqlite3 * db;
    int status = sqlite3_open(parh.UTF8String, &_db);
    if (status == SQLITE_OK) {
        NSLog(@"打开成功");
        //创建表
        const char *sql = "CREATE TABLE IF NOT EXISTS T_SHOP (id integer PRIMARY KEY,name text NOT NULL,price real)";
        char* errmes = NULL;
        sqlite3_exec(_db, sql,NULL , NULL, &errmes);
        if (errmes) {
            NSLog(@"创表失败--%s",errmes);
            
        }
    }
    else
    {
        NSLog(@"打开失败");
    }
    
    //关闭数据库
    //    sqlite3_close(<#sqlite3 *#>);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(id)sender {
    NSString * inster = [NSString stringWithFormat:@"INSERT INTO T_SHOP(name,price) VALUES ('%@','%f');",self.name.text,self.price.text.doubleValue];
    sqlite3_exec(self.db, inster.UTF8String, NULL, NULL, NULL);
}
@end
