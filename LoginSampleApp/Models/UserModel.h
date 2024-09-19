//
//  UserModel.h
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import <Foundation/Foundation.h>
#import "AddressModel.h"
#import "CompanyModel.h"

@interface UserModel : NSObject

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) AddressModel *address;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) CompanyModel *company;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
