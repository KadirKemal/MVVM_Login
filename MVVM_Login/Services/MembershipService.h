//
//  MembershipService.h
//  MVVM_Login
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface MembershipService : NSObject

-(void) controlAuthentication:(NSString *)email
                     password:(NSString *)pass
                      success:(void(^)(UserModel *userModel)) successCallback
                         fail:(void(^)(NSString *message)) failCallback;

@end
