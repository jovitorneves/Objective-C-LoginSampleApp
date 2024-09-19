//
//  LoginSampleAppUITests.m
//  LoginSampleAppUITests
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import <XCTest/XCTest.h>

@interface LoginSampleAppUITests : XCTestCase

@end

@implementation LoginSampleAppUITests

XCUIApplication *app;

- (void)setUp {
    self.continueAfterFailure = NO;
    app = [[XCUIApplication alloc] init];
    [app launch];
}

- (void)tearDown {
    app = nil;
}

- (void)testNavigation {
    XCUIElement *emailTextField = app.textFields[@"email"];
    XCTAssertTrue(emailTextField.exists);
    [emailTextField tap];
    [emailTextField typeText:@"email@email.com"];
    
    XCUIElement *passwordSecureTextField = app.secureTextFields[@"password"];
    XCTAssertTrue(passwordSecureTextField.exists);
    [passwordSecureTextField tap];
    [passwordSecureTextField typeText:@"123"];
    
    XCUIElement *keyboardBtn = app.buttons[@"Done"];
    XCTAssertTrue(keyboardBtn.exists);
    [keyboardBtn tap];
    
    XCUIElement *loginBtn = app.buttons[@"loginBtn"];
    XCTAssertTrue(loginBtn.exists);
    [loginBtn tap];
    
    [app.alerts[@"Login"].scrollViews.otherElements.buttons[@"OK"] tap];
}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *)) {
        [self measureWithMetrics:@[[[XCTApplicationLaunchMetric alloc] init]] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
