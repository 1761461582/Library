//
//  SetUpViewController.m
//  c3
//
//  Created by hy on 15/7/9.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "SetUpViewController.h"

@interface SetUpViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *textFieldUserName;
@property (nonatomic,strong) UITextField *textFieldPassWord;
@property (nonatomic,strong) UIButton    *btnRegister;

@end

@implementation SetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.textFieldUserName];
    [self.view addSubview:self.textFieldPassWord];
    [self.view addSubview:self.btnRegister];
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
        _textFieldUserName.placeholder = @"Email or Phone";
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

-(UIButton*)btnRegister
{
    if (_btnRegister == nil) {
        _btnRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_btnRegister setFrame:CGRectMake(30, 190, 200, 40)];
        [_btnRegister setTitle:@"Register" forState:UIControlStateNormal];
        [_btnRegister setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
        [_btnRegister addTarget:self action:@selector(Login:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnRegister;
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
        NSLog(@"The Register info is invalid");
        return;
    }
    NSLog(@"User name is %@, Password is %@", self.textFieldUserName.text,self.textFieldPassWord.text);
    
    if (arc4random()%2 == 0) {
        NSLog(@"Register Successfully");
        [self.delegate setUpWithSuccess];
    }else
    {
        NSLog(@"Fail to Register");
        [self.delegate setUpWithFailure];
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
