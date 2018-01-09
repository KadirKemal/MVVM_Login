//
//  ValidationHelperTests.m
//  MVVM_LoginTests
//
//  Created by Kadir Kemal Dursun on 09/01/2018.
//  Copyright © 2018 Kadir Kemal Dursun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ValidationHelper.h"

@interface ValidationHelperTests : XCTestCase

@end

@implementation ValidationHelperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIsValidEmailWithValidEmail{
    BOOL result = [[ValidationHelper new] isValidEmail:@"kkdursun@yahoo.com"];
    XCTAssertTrue(result, @"ValidationHelper returns invalid email for kkdursun@yahoo.com");
}

- (void)testIsValidEmailWithInvalidEmail{
    BOOL result = [[ValidationHelper new] isValidEmail:@"kkdursunhoo.com"];
    XCTAssertFalse(result, @"ValidationHelper returns valid email for kkdursunhoo.com");
}



- (void)testExample {
//    XCTestExpectation *expectation =
//    [self expectationWithDescription:@"High Expectations"];
//    
//    [self.pageLoader requestUrl:@"http://bignerdranch.com"
//              completionHandler:^(NSString *page) {
//                  
//                  NSLog(@"The web page is %ld bytes long.", page.length);
//                  XCTAssert(page.length > 0);
//                  [expectation fulfill];
//              }];
//    
//    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
//        if (error) {
//            NSLog(@"Timeout Error: %@", error);
//        }
//    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
