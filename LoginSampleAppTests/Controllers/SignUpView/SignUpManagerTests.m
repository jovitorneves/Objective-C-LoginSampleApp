//
//  SignUpManagerTests.m
//  LoginSampleAppTests
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import <XCTest/XCTest.h>
#import "SignUpViewManager.h"

@interface SignUpManagerTests : XCTestCase

@property (nonatomic, strong) SignUpViewManager *signUpViewManager;

@end

@implementation SignUpManagerTests

NSString *const msgErrorSignUp = @"Invalid fields!";
NSString *const msgPasswordSignUp = @"Passwords are not the same!";
NSString *const msgSuccessSignUp = @"User registered successfully!";

- (void)setUp {
    [super setUp];
    self.signUpViewManager = [[SignUpViewManager alloc] init];
}

- (void)tearDown {
    self.signUpViewManager = nil;
    [super tearDown];
}

- (void)testSignUpWithEmptyFields {
    [self.signUpViewManager signUpWithFullName:@""
                                         email:@""
                                         phone:@""
                                      password:@""
                                repeatPassword:@""
                                    completion:^(NSString *message,
                                                 BOOL success) {
        XCTAssertFalse(success, @"Signup should fail when fields are empty.");
        XCTAssertEqualObjects(message, msgErrorSignUp, @"The error message should be 'Invalid fields!'");
    }];
}

- (void)testSignUpWithMismatchedPasswords {
    [self.signUpViewManager signUpWithFullName:@"John Doe"
                                         email:@"john.doe@example.com"
                                         phone:@"123-456-7890"
                                      password:@"password123"
                                repeatPassword:@"password124"
                                    completion:^(NSString *message,
                                                 BOOL success) {
        XCTAssertFalse(success, @"Signup should fail when passwords don't match.");
        XCTAssertEqualObjects(message, msgPasswordSignUp, @"The error message should be 'Passwords are not the same!'");
    }];
}

- (void)testSignUpWithValidData {
    [self.signUpViewManager signUpWithFullName:@"John Doe"
                                         email:@"john.doe@example.com"
                                         phone:@"123-456-7890"
                                      password:@"password123"
                                repeatPassword:@"password123"
                                    completion:^(NSString *message,
                                                 BOOL success) {
        XCTAssertTrue(success, @"Signup should be successful with valid data.");
        XCTAssertEqualObjects(message, msgSuccessSignUp, @"The success message should be 'User registered successfully!'");
    }];
}

@end
