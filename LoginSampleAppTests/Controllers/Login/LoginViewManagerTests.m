//
//  LoginViewManagerTests.m
//  LoginSampleAppTests
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import <XCTest/XCTest.h>
#import "LoginViewManager.h"
#import "UserModel.h"

@interface LoginViewManagerTests : XCTestCase

@property (nonatomic, strong) LoginViewManager *loginViewManager;

@end

@implementation LoginViewManagerTests

NSString *const myErrorDomain = @"Invalid email or password!";

- (void)setUp {
    [super setUp];
    self.loginViewManager = [[LoginViewManager alloc] init];
}

- (void)tearDown {
    self.loginViewManager = nil;
    [super tearDown];
}

- (void)testFetchUsersWithEmptyCredentials {
    [self.loginViewManager fetchUsersWithEmail:@"" 
                                      password:@""
                                     completion:^(NSArray<UserModel *> *users,
                                                  NSError *error) {
        XCTAssertNil(users, @"Users array should be nil when email or password is empty.");
        XCTAssertNotNil(error, @"Error should not be nil when email or password is empty.");
        XCTAssertEqualObjects(error.domain, myErrorDomain, @"Error domain should be 'Invalid email or password!'");
        XCTAssertEqual(error.code, 404, @"Error code should be 404 for invalid credentials.");
        XCTAssertEqualObjects(error.localizedDescription, @"Failed to fetch users. Please try again later.",
                              @"Error description should be 'Failed to fetch users. Please try again later.'");
    }];
}

- (void)testFetchUsersWithNetworkError {
    NSURL *url = [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/users"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data,
                                                                NSURLResponse *response,
                                                                NSError *error) {
        XCTAssertNotNil(error, @"Error should not be nil for network errors.");
        XCTAssertNil(data, @"Data should be nil when there's a network error.");
    }];
    
    NSError *networkError = [NSError errorWithDomain:NSURLErrorDomain
                                                code:NSURLErrorNotConnectedToInternet
                                            userInfo:nil];
    [self.loginViewManager fetchUsersWithEmail:@"test@example.com"
                                      password:@"password"
                                    completion:^(NSArray<UserModel *> *users,
                                                 NSError *error) {
        XCTAssertNil(users, @"Users should be nil when there's a network error.");
        XCTAssertNotNil(error, @"Error should not be nil when there's a network error.");
        XCTAssertEqualObjects(error.domain,
                              networkError.domain, @"Error domain should match network error domain.");
        XCTAssertEqual(error.code,
                       networkError.code, @"Error code should match network error code.");
    }];
}

- (void)testFetchUsersWithValidData {
    [self.loginViewManager fetchUsersWithEmail:@"test@example.com" 
                                      password:@"password"
                                     completion:^(NSArray<UserModel *> *users,
                                                  NSError *error) {
        XCTAssertNil(error, @"Error should be nil when the fetch is successful.");
        XCTAssertNotNil(users, @"Users array should not be nil when fetch is successful.");
        XCTAssertTrue([users isKindOfClass:[NSArray class]], @"Users should be an array.");
        XCTAssertTrue(users.count > 0, @"Users array should not be empty.");
    }];
}

@end
