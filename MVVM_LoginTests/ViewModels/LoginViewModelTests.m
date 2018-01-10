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
#import "UserModel.h"

#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>


@interface LoginViewModelTests : XCTestCase

@property LoginViewModel *loginViewModel;

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
    
    ValidationHelper *mockValidationHelper = OCMClassMock([ValidationHelper class]);
    OCMStub([mockValidationHelper isValidEmail:[OCMArg any]]).andReturn(NO);
    
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

- (void)testControlAuthenticationWithValidEmailAndInvalidPassword{
    ValidationHelper *mockValidationHelper = OCMClassMock([ValidationHelper class]);
    OCMStub([mockValidationHelper isValidEmail:[OCMArg any]]).andReturn(YES);
    OCMStub([mockValidationHelper isValidPassword:[OCMArg any]]).andReturn(PasswordValidationStatusShort);
    
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

- (void)testControlAuthenticationWithIncorrectEmailOrPassword{
    NSString *someMessage = @"Some Message";
    
    ValidationHelper *mockValidationHelper = OCMClassMock([ValidationHelper class]);
    OCMStub([mockValidationHelper isValidEmail:[OCMArg any]]).andReturn(YES);
    OCMStub([mockValidationHelper isValidPassword:[OCMArg any]]).andReturn(PasswordValidationStatusValid);
    
    MembershipService *mockMemService = OCMClassMock([MembershipService class]);
    OCMStub([mockMemService controlAuthentication:[OCMArg any] password:[OCMArg any] success:[OCMArg any] fail:([OCMArg invokeBlockWithArgs:someMessage, nil])]);
    
    LoginViewModel *loginViewModel = [[LoginViewModel alloc] initWithMembershipService:mockMemService];
    loginViewModel.validationHelper = mockValidationHelper;
    
    __block SignalResult *r = nil;
    [[loginViewModel controlAuthentication:@"" password:@""] subscribeNext:^(SignalResult *x) {
        r = x;
    }];
    
    expect(r).willNot.beNil();
    expect(r.isSuccess).will.beFalsy();
    expect(r.errorMessage).willNot.beNil();
    expect(r.errorMessage).will.equal(someMessage);
    expect(r.result).will.beNil();
}

- (void)testControlAuthenticationWithCorrectEmailAndPassword{
    NSInteger userId = 5;
    UserModel *user = [UserModel new];
    user.userId = userId;
    
    ValidationHelper *mockValidationHelper = OCMClassMock([ValidationHelper class]);
    OCMStub([mockValidationHelper isValidEmail:[OCMArg any]]).andReturn(YES);
    OCMStub([mockValidationHelper isValidPassword:[OCMArg any]]).andReturn(PasswordValidationStatusValid);
    
    MembershipService *mockMemService = OCMClassMock([MembershipService class]);
    OCMStub([mockMemService controlAuthentication:[OCMArg any] password:[OCMArg any] success:([OCMArg invokeBlockWithArgs:user, nil]) fail:[OCMArg any]]);
    
    LoginViewModel *loginViewModel = [[LoginViewModel alloc] initWithMembershipService:mockMemService];
    loginViewModel.validationHelper = mockValidationHelper;
    
    __block SignalResult *r = nil;
    __block UserModel *returnUser = nil;
    [[loginViewModel controlAuthentication:@"" password:@""] subscribeNext:^(SignalResult *x) {
        r = x;
        returnUser = (UserModel *) (r.result);
    }];
    
    expect(r).willNot.beNil();
    expect(r.isSuccess).will.beTruthy();
    expect(r.errorMessage).will.beNil();
    expect(r.result).willNot.beNil();
    expect(returnUser.userId).will.equal(userId);
}

@end
