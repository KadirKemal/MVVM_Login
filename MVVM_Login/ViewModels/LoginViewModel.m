//
//  LoginModelView.m
//  MVVM_Login
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel{
    MembershipService *membershipService;
}

-(instancetype)initWithMembershipService:(MembershipService *)memService{
    self = [super init];
    if(self){
        membershipService = memService;
    }
    return self;
}

-(RACSignal *) controlAuthentication:(NSString *)email password:(NSString *)password{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        if(! [self.validationHelper isValidEmail:email]){
            [subscriber sendNext:[[SignalResult alloc] initWithErrorMessage:@"Invalid Email"]];
            [subscriber sendCompleted];
        }
        
        if([self.validationHelper isValidPassword:password] != PasswordValidationStatusValid){
            [subscriber sendNext:[[SignalResult alloc] initWithErrorMessage:@"Invalid Password"]];
            [subscriber sendCompleted];
        }
        
        [membershipService controlAuthentication:email
                                        password:password
                                         success:^(UserModel *userModel) {
                                             [subscriber sendNext:[[SignalResult alloc] initWithResult:userModel]];
                                             [subscriber sendCompleted];
                                         }
                                            fail:^(NSString *message) {
                                                [subscriber sendNext:[[SignalResult alloc] initWithErrorMessage:message]];
                                                [subscriber sendCompleted];
                                            }
         ];
        
        return nil;
    }];
}

@end
