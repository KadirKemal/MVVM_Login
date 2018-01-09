//
//  ValidationHelper.h
//  MVVM_Login
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PasswordValidationStatus) {
    PasswordValidationStatusValid = 0,
    PasswordValidationStatusShort,
    PasswordValidationStatusNotContainNumber,
    PasswordValidationStatusNotContainCharacter
};

@interface ValidationHelper : NSObject

-(BOOL) isValidEmail:(NSString *) email;

-(PasswordValidationStatus) isValidPassword:(NSString *) password;

@end
