//
//  CompanyModel.m
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import "CompanyModel.h"

@implementation CompanyModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _name = dictionary[@"name"];
        _catchPhrase = dictionary[@"catchPhrase"];
        _bs = dictionary[@"bs"];
    }
    return self;
}

@end
