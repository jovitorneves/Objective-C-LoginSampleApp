//
//  SignUpViewManager.h
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import <Foundation/Foundation.h>

@interface SignUpViewManager : NSObject

typedef void (^CompletionBlock)(NSString *resultText,
                                BOOL success);

- (void)signUpWithFullName:(NSString *)fullName
                     email:(NSString *)email
                     phone:(NSString *)phone
                  password:(NSString *)password
            repeatPassword:(NSString *)repeatPassword
                completion:(CompletionBlock)completion;

@end
