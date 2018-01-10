//
//  ViewController.m
//  MVVM_Login
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)onClickedLogIn:(id)sender {
    [[self.loginViewModel controlAuthentication:_emailTextField.text password:_passwordTextField.text]
     subscribeNext:^(SignalResult *r){
         if(r.isSuccess){
             [self onDidSuccessLogin:r.result];
         }
         else{
             [self onDidFailLogin:r.errorMessage];
         }
     }];
}

-(void) onDidSuccessLogin:(UserModel *) userModel{
    _resultLabel.text = userModel.fullname;
}

-(void) onDidFailLogin:(NSString *) message{
    _resultLabel.text = message;
}




@end
