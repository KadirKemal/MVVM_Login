//
//  SignalResult.h
//  MVVM_Login
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignalResult : NSObject

- (instancetype) initWithResult:(id)result;
- (instancetype) initWithErrorMessage:(NSString *)message;

@property (strong, nonatomic) id result;
@property (nonatomic) BOOL isSuccess;
@property (nonatomic, copy) NSString *errorMessage;

@end
