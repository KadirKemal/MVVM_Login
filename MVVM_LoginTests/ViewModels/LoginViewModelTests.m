//
//  LoginViewModelTests.m
//  MVVM_LoginTests
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LoginViewModel.h"
#import "ValidationHelper.h"
#import "MembershipService.h"

#import <Expecta/Expecta.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>

@interface LoginViewModelTests : XCTestCase

@end

@implementation LoginViewModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testControlAuthenticationWithInvalidEmail{
    [Expecta setAsynchronousTestTimeout:1]; // default is 1 sec
    
    ValidationHelper *mockValidationHelper = mock([ValidationHelper class]);
    [given([mockValidationHelper isValidEmail:anything()]) willReturnBool:NO];
    
    LoginViewModel *loginViewModel = [[LoginViewModel alloc] initWithMembershipService:nil];
    loginViewModel.validationHelper = mockValidationHelper;
    
    __block SignalResult *r = nil;
    [[loginViewModel controlAuthentication:@"" password:@""] subscribeNext:^(SignalResult *x) {
        r = x;
    }];
    
    expect(r).willNot.beNil();
    expect(r.isSuccess).will.beFalsy();
    expect(r.errorMessage).willNot.beNil();
    expect(r.result).will.beNil();
}

@end
