//
//  ResultsTableViewCell.h.m
//  PiQAlikeTestApp
//
//  Created by Vengal on 10/06/16.
//  Copyright © 2016 Streamoid Technologies. All rights reserved.
//

#import "ResultsTableViewCell.h"

@implementation ResultsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadCellWithFirstProduct:(id )firstProduct SecondProduct:(id )secondProduct AndIndexPathRow:(NSInteger )row {
    //Setting data for first product in a cell
    NSInteger index = row*2;
    self.firstBrandLabel.hidden = NO;
    self.firstCategoryLabel.hidden = NO;
    self.firstShopImageView.hidden = NO;
    if ([firstProduct isKindOfClass:[NSDictionary class]]) {
        self.firstPriceLabel.hidden = NO;
        self.firstDiscountBtn.hidden = NO;
        
        NSDictionary *productObject = (NSDictionary *)firstProduct;
        NSString *imageUrl = @"";
        NSArray *images = (NSArray *)[productObject objectForKey:@"image_urls"];
        if (images.count > 0) {
            imageUrl = [images objectAtIndex:0];
        }
        if (imageUrl == nil || [imageUrl isKindOfClass:[NSNull class]] || imageUrl.length == 0) {
            imageUrl = [productObject objectForKey:@"thumbnail_url"];
        }
        
        if(imageUrl != nil && imageUrl.length > 0){
            //Image download code
            [self.firstShopImageView setImageWithURL:[NSURL URLWithString:imageUrl]];
        }
        NSInteger discountedPrice = [[productObject objectForKey:@"discounted_price"] integerValue];
        NSInteger price = [[productObject objectForKey:@"price"] integerValue];
        NSString *brand = [productObject objectForKey:@"brand"];
        NSString *currency = [productObject objectForKey:@"currency"];
        NSString *category = [productObject objectForKey:@"category"];
        NSInteger dicountPercentage = [[productObject objectForKey:@"discount_percent"] integerValue];
        if ([currency isKindOfClass:[NSNull class]] || currency == nil) {
            currency = @"";
        }
        if ([brand isKindOfClass:[NSNull class]] || brand == nil) {
            brand = @"";
        }
        if ([category isKindOfClass:[NSNull class]] || category == nil) {
            category = @"";
        }
        
        if (discountedPrice == 0 || price == discountedPrice) {
            self.firstDiscountBtn.hidden = YES;
        } else {
            self.firstDiscountBtn.hidden = NO;
            [self.firstDiscountBtn setTitle:[NSString stringWithFormat:@"%d%% off",(int)round(dicountPercentage)] forState:UIControlStateNormal];
        }
        NSString *currencySymbol = [self currencySymbolStrFor:currency];
        if((discountedPrice == 0 || price == discountedPrice) && price && price > 0 ) {
            self.firstPriceLabel.text = [NSString stringWithFormat:@"\n%@ %ld", currencySymbol, (long)price];
        } else if(price && discountedPrice && price > 0 && discountedPrice > 0) {
            NSMutableDictionary* attrDict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                              NSFontAttributeName : [UIFont fontWithName:@"Avenir-Roman" size:10.0f],
                                                                                              NSForegroundColorAttributeName : [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.54],
                                                                                              NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),
                                                                                              NSStrikethroughColorAttributeName : [UIColor colorWithRed:129.0/255.0 green:129.0/255.0 blue:129.0/255.0 alpha:0.87]
                                                                                              }];
            NSString* the_str = [NSString stringWithFormat:@"%@ %ld", currencySymbol, (long)price];
            NSAttributedString* attrStr_orgPrice = [[NSAttributedString alloc] initWithString:the_str attributes:attrDict];
            
            the_str = [NSString stringWithFormat:@"\n%@ %ld", currencySymbol, (long)discountedPrice];
            [attrDict removeObjectForKey:NSStrikethroughStyleAttributeName];
            [attrDict removeObjectForKey:NSStrikethroughColorAttributeName];
            [attrDict setObject:[UIColor colorWithRed:239.0/255.0 green:60.0/255.0 blue:64.0/255.0 alpha:1.0] forKey:NSForegroundColorAttributeName];
            [attrDict setObject:[UIFont fontWithName:@"Avenir-Roman" size:11.0] forKey:NSFontAttributeName];
            NSAttributedString* attrStr_discPrice = [[NSAttributedString alloc] initWithString:the_str attributes:attrDict];
            
            NSMutableAttributedString* mutableAttrStr = [[NSMutableAttributedString alloc] initWithAttributedString:attrStr_orgPrice];
            [mutableAttrStr appendAttributedString:attrStr_discPrice];
            self.firstPriceLabel.attributedText = mutableAttrStr;
        }
        
        NSString *brandStr;
        if (brand.length > 0) {
            brandStr = brand;
        }
        self.firstBrandLabel.text = [brandStr capitalizedString];
        self.firstCategoryLabel.text = [category capitalizedString];
    }
    
    //Setting data for second product in a cell
    index = index+1;
    if (secondProduct == nil) {
        //Item not exist for second product
        self.secondBrandLabel.hidden = YES;
        self.secondCategoryLabel.hidden = YES;
        self.secondPriceLabel.hidden = YES;
        self.secondDiscountBtn.hidden = YES;
        self.secondShopImageView.hidden = YES;
    } else {
        self.secondBrandLabel.hidden = NO;
        self.secondCategoryLabel.hidden = NO;
        self.secondShopImageView.hidden = NO;
        
        if ([secondProduct isKindOfClass:[NSDictionary class]]) {
            self.secondPriceLabel.hidden = NO;
            self.secondDiscountBtn.hidden = NO;
            
            NSDictionary *productObject = (NSDictionary *)secondProduct;
            
            NSString *imageUrl = @"";
            NSArray *images = (NSArray *)[productObject objectForKey:@"image_urls"];
            if (images.count > 0) {
                imageUrl = [images objectAtIndex:0];
            }
            if (imageUrl == nil || [imageUrl isKindOfClass:[NSNull class]] || imageUrl.length == 0) {
                imageUrl = [productObject objectForKey:@"thumbnail_url"];
            }
            
            if(imageUrl != nil && imageUrl.length > 0){
                [self.secondShopImageView setImageWithURL:[NSURL URLWithString:imageUrl]];
            }
            NSInteger discountedPrice = [[productObject objectForKey:@"discounted_price"] integerValue];
            NSInteger price = [[productObject objectForKey:@"price"] integerValue];
            NSString *brand = [productObject objectForKey:@"brand"];
            NSString *currency = [productObject objectForKey:@"currency"];
            NSString *category = [productObject objectForKey:@"category"];
            NSInteger dicountPercentage = [[productObject objectForKey:@"discount_percent"] integerValue];
            
            if ([currency isKindOfClass:[NSNull class]] || currency == nil) {
                currency = @"";
            }
            if ([brand isKindOfClass:[NSNull class]] || brand == nil) {
                brand = @"";
            }
            if ([category isKindOfClass:[NSNull class]] || category == nil) {
                category = @"";
            }
            
            if (discountedPrice == 0 || price == discountedPrice) {
                self.secondDiscountBtn.hidden = YES;
            } else {
                self.secondDiscountBtn.hidden = NO;
                [self.secondDiscountBtn setTitle:[NSString stringWithFormat:@"%d%% off",(int)round(dicountPercentage)] forState:UIControlStateNormal];
            }
            
            NSString *currencySymbol = [self currencySymbolStrFor:currency];
            if((discountedPrice == 0 || price == discountedPrice) && price && price > 0 ) {
                self.secondPriceLabel.text = [NSString stringWithFormat:@"\n%@ %ld", currencySymbol, (long)price];
            } else if(price && discountedPrice && price > 0 && discountedPrice > 0) {
                NSMutableDictionary* attrDict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                                  NSFontAttributeName : [UIFont fontWithName:@"Avenir-Roman" size:10.0],
                                                                                                  NSForegroundColorAttributeName : [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.54],
                                                                                                  NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),
                                                                                                  NSStrikethroughColorAttributeName : [UIColor colorWithRed:129.0/255.0 green:129.0/255.0 blue:129.0/255.0 alpha:0.87]
                                                                                                  }];
                NSString* the_str = [NSString stringWithFormat:@"%@ %ld", currencySymbol, (long)price];
                NSAttributedString* attrStr_orgPrice = [[NSAttributedString alloc] initWithString:the_str attributes:attrDict];
                
                the_str = [NSString stringWithFormat:@"\n%@ %ld", currencySymbol, (long)discountedPrice];
                [attrDict removeObjectForKey:NSStrikethroughStyleAttributeName];
                [attrDict removeObjectForKey:NSStrikethroughColorAttributeName];
                [attrDict setObject:[UIColor colorWithRed:239.0/255.0 green:60.0/255.0 blue:64.0/255.0 alpha:1.0] forKey:NSForegroundColorAttributeName];
                [attrDict setObject:[UIFont fontWithName:@"Avenir-Roman" size:11.0] forKey:NSFontAttributeName];
                NSAttributedString* attrStr_discPrice = [[NSAttributedString alloc] initWithString:the_str attributes:attrDict];
                
                NSMutableAttributedString* mutableAttrStr = [[NSMutableAttributedString alloc] initWithAttributedString:attrStr_orgPrice];
                [mutableAttrStr appendAttributedString:attrStr_discPrice];
                self.secondPriceLabel.attributedText = mutableAttrStr;
            }
            
            NSString *brandStr;
            if (brand.length > 0) {
                brandStr = brand;
            }
            self.secondBrandLabel.text = [brandStr capitalizedString];
            self.secondCategoryLabel.text = [category capitalizedString];
        }
    }
}

- (NSString *)currencySymbolStrFor:(NSString *)inCurrency {
    NSString *toReturnStr = @"\u20b9";
    if ([inCurrency isEqualToString:@"INR"]) {
        toReturnStr = @"\u20b9";
    } else if ([inCurrency isEqualToString:@"USD"]) {
        toReturnStr = @"\u0024";
    } else {
        toReturnStr = @"\u20b9";
    }
    
    return toReturnStr;
}


- (void)prepareForReuse {
    self.firstShopImageView.image = nil;
    self.secondShopImageView.image = nil;
    self.firstBrandLabel.text = nil;
    self.firstCategoryLabel.text = nil;
    self.secondBrandLabel.text = nil;
    self.secondCategoryLabel.text = nil;
    self.firstPriceLabel.text = nil;
    self.secondPriceLabel.text = nil;
}

@end
