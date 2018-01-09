//
//  MembershipService.m
//  MVVM_Login
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import "MembershipService.h"

@implementation MembershipService

-(void) controlAuthentication:(NSString *)email
                     password:(NSString *)pass
                      success:(void(^)(UserModel *userModel)) successCallback
                         fail:(void(^)(NSString *message)) failCallback{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        sleep(1);
        successCallback([UserModel new]);
    });

}

@end
