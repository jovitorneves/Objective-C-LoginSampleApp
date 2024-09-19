//
//  AddressModel.h
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import <Foundation/Foundation.h>
#import "GeoModel.h"

@interface AddressModel : NSObject

@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *suite;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) GeoModel *geo;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
