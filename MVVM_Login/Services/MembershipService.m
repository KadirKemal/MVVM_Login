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
        
        if([email isEqualToString:@"kkdursun@yahoo.com"] && [pass isEqualToString:@"pass123"]){
            UserModel *m = [UserModel new];
            m.userId = 1;
            m.firstName = @"Kadir Kemal";
            m.lastName = @"Dursun";
            dispatch_async(dispatch_get_main_queue(), ^{
                successCallback(m);
            });
        }
        else{
            dispatch_async(dispatch_get_main_queue(), ^{
                failCallback(@"Your email or password is incorrect");
            });
        }
        
    });

}

@end
