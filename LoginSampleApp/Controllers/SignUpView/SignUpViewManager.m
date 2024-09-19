//
//  SignUpViewManager.m
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import "SignUpViewManager.h"

@implementation SignUpViewManager

NSString *const msgErrorSignUp = @"Invalid fields!";
NSString *const msgPasswordSignUp = @"Passwords are not the same!";
NSString *const msgSuccessSignUp = @"User registered successfully!";

- (void)signUpWithFullName:(NSString *)fullName
                     email:(NSString *)email
                     phone:(NSString *)phone
                  password:(NSString *)password
            repeatPassword:(NSString *)repeatPassword
          completion:(CompletionBlock)completion {
    if (fullName.length == 0 ||
        email.length == 0 ||
        phone.length == 0 ||
        password.length == 0 ||
        repeatPassword.length == 0) {
        completion(msgErrorSignUp, false);
    } else if (![password.description isEqualToString:repeatPassword.description]) {
        completion(msgPasswordSignUp, false);
    } else {
        completion(msgSuccessSignUp, true);
    }
}

@end
