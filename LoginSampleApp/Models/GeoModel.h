//
//  GeoModel.h
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import <Foundation/Foundation.h>

@interface GeoModel : NSObject

@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lng;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
