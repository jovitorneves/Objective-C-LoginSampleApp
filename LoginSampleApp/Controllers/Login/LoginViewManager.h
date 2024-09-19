//
//  LoginViewManager.h
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface LoginViewManager : NSObject

- (void)fetchUsersWithEmail:(NSString*)email
                   password:(NSString*)password
                 completion:(void (^)(NSArray<UserModel *> *users,
                                      NSError *error))completion;

@end

