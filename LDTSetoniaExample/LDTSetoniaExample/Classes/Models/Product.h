#import <Foundation/Foundation.h>

/**
 A data model class for the "Product" returned by the Setonia API.
 
 @discussion the API actually returns this "Product" in all of their v1 method reponses.
 */
@interface Product : NSObject {

    NSString *aSIN;
    NSString *brand;
    NSString *eAN;
    NSString *features;
    NSString *model;
    NSString *photoURL;
    NSString *price;
    NSString *productGroup;
    NSString *productId;
    NSString *salesRank;
    NSString *site;
    NSString *sKU;
    NSString *title;
    NSString *uPC;
    NSString *uRL;

}

@property (nonatomic, copy) NSString *aSIN;
@property (nonatomic, copy) NSString *brand;
@property (nonatomic, copy) NSString *eAN;
@property (nonatomic, copy) NSString *features;
@property (nonatomic, copy) NSString *model;
@property (nonatomic, copy) NSString *photoURL;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *productGroup;
@property (nonatomic, copy) NSString *productId;
@property (nonatomic, copy) NSString *salesRank;
@property (nonatomic, copy) NSString *site;
@property (nonatomic, copy) NSString *sKU;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *uPC;
@property (nonatomic, copy) NSString *uRL;

+ (Product *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
