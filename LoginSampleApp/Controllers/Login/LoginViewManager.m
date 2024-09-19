//
//  LoginViewManager.m
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import "LoginViewManager.h"
#import "UserModel.h"

@interface LoginViewManager ()

@end

@implementation LoginViewManager

NSString *const myErrorDomain = @"Invalid email or password!";

- (void)fetchUsersWithEmail:(NSString*)email
                   password:(NSString*)password
                 completion:(void (^)(NSArray<UserModel *> *users,
                                      NSError *error))completion {
    
    if (email.length == 0 || password.length == 0) {
        NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : @"Failed to fetch users. Please try again later." };
        NSError *customError = [NSError errorWithDomain:myErrorDomain
                                                   code:404
                                               userInfo:userInfo];
        completion(nil, customError);
        return;
    }
    NSURL *url = [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/users"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                           completionHandler:^(NSData *data,
                                                               NSURLResponse *response,
                                                               NSError *error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data
                                                             options:0
                                                               error:&jsonError];
        
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        NSMutableArray<UserModel *> *usersArray = [NSMutableArray array];
        
        for (NSDictionary *userDict in jsonArray) {
            UserModel *user = [[UserModel alloc] initWithDictionary:userDict];
            [usersArray addObject:user];
        }
        
        completion([usersArray copy], nil);
    }];
    
    [dataTask resume];
}

@end
