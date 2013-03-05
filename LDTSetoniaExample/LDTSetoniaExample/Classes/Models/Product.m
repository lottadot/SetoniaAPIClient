#import "Product.h"

@implementation Product

@synthesize aSIN;
@synthesize brand;
@synthesize eAN;
@synthesize features;
@synthesize model;
@synthesize photoURL;
@synthesize price;
@synthesize productGroup;
@synthesize productId;
@synthesize salesRank;
@synthesize site;
@synthesize sKU;
@synthesize title;
@synthesize uPC;
@synthesize uRL;
+ (Product *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    Product *instance = [[Product alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"ASIN"]) {
        [self setValue:value forKey:@"aSIN"];
    } else if ([key isEqualToString:@"Brand"]) {
        [self setValue:value forKey:@"brand"];
    } else if ([key isEqualToString:@"EAN"]) {
        [self setValue:value forKey:@"eAN"];
    } else if ([key isEqualToString:@"Features"]) {
        [self setValue:value forKey:@"features"];
    } else if ([key isEqualToString:@"Model"]) {
        [self setValue:value forKey:@"model"];
    } else if ([key isEqualToString:@"PhotoURL"]) {
        [self setValue:value forKey:@"photoURL"];
    } else if ([key isEqualToString:@"Price"]) {
        [self setValue:value forKey:@"price"];
    } else if ([key isEqualToString:@"ProductGroup"]) {
        [self setValue:value forKey:@"productGroup"];
    } else if ([key isEqualToString:@"ProductId"]) {
        [self setValue:value forKey:@"productId"];
    } else if ([key isEqualToString:@"SalesRank"]) {
        [self setValue:value forKey:@"salesRank"];
    } else if ([key isEqualToString:@"Site"]) {
        [self setValue:value forKey:@"site"];
    } else if ([key isEqualToString:@"SKU"]) {
        [self setValue:value forKey:@"sKU"];
    } else if ([key isEqualToString:@"Title"]) {
        [self setValue:value forKey:@"title"];
    } else if ([key isEqualToString:@"UPC"]) {
        [self setValue:value forKey:@"uPC"];
    } else if ([key isEqualToString:@"URL"]) {
        [self setValue:value forKey:@"uRL"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.aSIN) {
        [dictionary setObject:self.aSIN forKey:@"aSIN"];
    }

    if (self.brand) {
        [dictionary setObject:self.brand forKey:@"brand"];
    }

    if (self.eAN) {
        [dictionary setObject:self.eAN forKey:@"eAN"];
    }

    if (self.features) {
        [dictionary setObject:self.features forKey:@"features"];
    }

    if (self.model) {
        [dictionary setObject:self.model forKey:@"model"];
    }

    if (self.photoURL) {
        [dictionary setObject:self.photoURL forKey:@"photoURL"];
    }

    if (self.price) {
        [dictionary setObject:self.price forKey:@"price"];
    }

    if (self.productGroup) {
        [dictionary setObject:self.productGroup forKey:@"productGroup"];
    }

    if (self.productId) {
        [dictionary setObject:self.productId forKey:@"productId"];
    }

    if (self.salesRank) {
        [dictionary setObject:self.salesRank forKey:@"salesRank"];
    }

    if (self.site) {
        [dictionary setObject:self.site forKey:@"site"];
    }

    if (self.sKU) {
        [dictionary setObject:self.sKU forKey:@"sKU"];
    }

    if (self.title) {
        [dictionary setObject:self.title forKey:@"title"];
    }

    if (self.uPC) {
        [dictionary setObject:self.uPC forKey:@"uPC"];
    }

    if (self.uRL) {
        [dictionary setObject:self.uRL forKey:@"uRL"];
    }

    return dictionary;

}


@end
