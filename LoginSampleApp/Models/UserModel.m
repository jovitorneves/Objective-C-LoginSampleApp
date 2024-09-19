//
//  UserModel.m
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import "UserModel.h"
#import "AddressModel.h"
#import "CompanyModel.h"

@implementation UserModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _userId = [dictionary[@"id"] integerValue];
        _name = dictionary[@"name"];
        _username = dictionary[@"username"];
        _email = dictionary[@"email"];
        _address = [[AddressModel alloc] initWithDictionary:dictionary[@"address"]];
        _phone = dictionary[@"phone"];
        _website = dictionary[@"website"];
        _company = [[CompanyModel alloc] initWithDictionary:dictionary[@"company"]];
    }
    return self;
}

@end
