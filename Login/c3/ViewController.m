//
//  ViewController.m
//  c3
//
//  Created by hy on 15/7/5.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "ViewController.h"
#import "LogInViewController.h"
#import "SetUpViewController.h"

@interface ViewController ()<LogInDelegate,SetUpDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)logInWithFailure
{
    [self dismissViewControllerAnimated:TRUE completion:^{
        NSLog(@"Done!");
    }];
}

-(void)logInWithSuccess
{
    [self dismissViewControllerAnimated:TRUE completion:^{
        NSLog(@"Done!");
    }];
}

-(void)setUpWithFailure
{
    [self dismissViewControllerAnimated:TRUE completion:^{
        NSLog(@"Done!");
    }];
}

-(void)setUpWithSuccess
{
    [self dismissViewControllerAnimated:TRUE completion:^{
        NSLog(@"Done!");
    }];
}


- (IBAction)popUp:(id)sender {
    
    LogInViewController *vs = [[LogInViewController alloc] init];
    vs.delegate = self;
    [self presentViewController:vs animated:YES completion:nil  ];
}
- (IBAction)Register:(id)sender {
    SetUpViewController *vs = [[SetUpViewController alloc] init];
    vs.delegate = self;
    [self presentViewController:vs animated:YES completion:nil  ];
}

@end
