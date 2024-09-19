//
//  GeoModel.m
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import "GeoModel.h"

@implementation GeoModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _lat = dictionary[@"lat"];
        _lng = dictionary[@"lng"];
    }
    return self;
}

@end
