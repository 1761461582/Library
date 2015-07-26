//
//  ViewController.m
//  c2
//
//  Created by hy on 15/7/5.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "ViewControllers.h"

@interface ViewControllers ()<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *textFieldUserName;
@property (nonatomic,strong) UITextField *textFieldPassWord;
@property (nonatomic,strong) UIButton    *btnLogin;
@end

@implementation ViewControllers

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.textFieldUserName];
    [self.view addSubview:self.textFieldPassWord];
    [self.view addSubview:self.btnLogin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITextField*)textFieldUserName
{
    if (_textFieldUserName == nil) {
        _textFieldUserName = [[UITextField alloc] initWithFrame:CGRectMake(30,50,200,40)];
        _textFieldUserName.borderStyle = UITextBorderStyleRoundedRect ;
        _textFieldUserName.placeholder = @"Email or PhoneNumber";
        _textFieldUserName.delegate = self;
        [_textFieldUserName setFont:[UIFont systemFontOfSize:12]];
    }
    
    return _textFieldUserName;
}

-(UITextField*)textFieldPassWord
{
    if (_textFieldPassWord == nil) {
        _textFieldPassWord = [[UITextField alloc] initWithFrame:CGRectMake(30,120,200,40)];
        _textFieldPassWord.borderStyle = UITextBorderStyleRoundedRect ;
        _textFieldPassWord.placeholder = @"Password";
        _textFieldPassWord.delegate = self;
        [_textFieldPassWord setFont:[UIFont systemFontOfSize:12]];
    }
    
    return _textFieldPassWord;
}

-(UIButton*)btnLogin
{
    if (_btnLogin == nil) {
        _btnLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_btnLogin setFrame:CGRectMake(30, 190, 200, 40)];
        [_btnLogin setTitle:@"Login" forState:UIControlStateNormal];
        [_btnLogin setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
        [_btnLogin addTarget:self action:@selector(Login:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnLogin;
}

#pragma - make UTextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return TRUE;
}

- (void)Login:(id)sender {
    
    if (self.textFieldUserName.text.length ==0 || self.textFieldPassWord.text.length == 0) {
        NSLog(@"The login info is invalid");
        return;
    }
    NSLog(@"User name is %@, Password is %@", self.textFieldUserName.text,self.textFieldPassWord.text);
}

@end
