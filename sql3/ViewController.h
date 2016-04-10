//
//  ViewController.h
//  sql3
//
//  Created by EMPty on 4/10/16.
//  Copyright (c) 2016 EMPty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *price;

- (IBAction)add:(id)sender;
@end

