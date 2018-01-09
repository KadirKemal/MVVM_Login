//
//  SignalResult.m
//  MVVM_Login
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import "SignalResult.h"

@implementation SignalResult

- (instancetype) initWithResult:(id)result{
    self = [super init];
    if(self){
        _result = result;
        _isSuccess = YES;
        _errorMessage = nil;
    }
    return self;
}

- (instancetype) initWithErrorMessage:(NSString *)message{
    self = [super init];
    if(self){
        _result = nil;
        _isSuccess = NO;
        _errorMessage = message;
    }
    return self;
}

@end
