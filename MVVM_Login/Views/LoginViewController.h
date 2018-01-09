//
//  ViewController.h
//  MVVM_Login
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewModel.h"

@interface LoginViewController : UIViewController

@property (strong, nonatomic) LoginViewModel *loginViewModel;

@end

