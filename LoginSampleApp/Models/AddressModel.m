//
//  AddressModel.m
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import "AddressModel.h"
#import "GeoModel.h"

@implementation AddressModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _street = dictionary[@"street"];
        _suite = dictionary[@"suite"];
        _city = dictionary[@"city"];
        _zipcode = dictionary[@"zipcode"];
        _geo = [[GeoModel alloc] initWithDictionary:dictionary[@"geo"]];
    }
    return self;
}

@end
