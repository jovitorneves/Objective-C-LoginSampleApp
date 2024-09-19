//
//  CompanyModel.h
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import <Foundation/Foundation.h>

@interface CompanyModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *catchPhrase;
@property (nonatomic, strong) NSString *bs;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
