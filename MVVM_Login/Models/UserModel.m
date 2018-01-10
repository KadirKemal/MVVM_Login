//
//  UserModel.m
//  MVVM_Login
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(NSString *)fullname{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
