//
//  LoginModelView.h
//  MVVM_Login
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveObjC.h"
#import "MembershipService.h"
#import "ValidationHelper.h"
#import "SignalResult.h"

@interface LoginViewModel : NSObject

@property (strong, nonatomic) ValidationHelper *validationHelper;

- (instancetype)initWithMembershipService:(MembershipService *) memService;

-(RACSignal *) controlAuthentication:(NSString *)email password:(NSString *)password;

@end
