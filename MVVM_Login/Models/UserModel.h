//
//  UserModel.h
//  MVVM_Login
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic) NSInteger userId;
@property (nonatomic, copy) NSString* firstName;
@property (nonatomic, copy) NSString* lastName;

@end
