//
//  ResultsTableViewCell.h
//  PiQAlikeTestApp
//
//  Created by Vengal on 10/06/16.
//  Copyright © 2016 Streamoid Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking/AFNetworking.h"
#import "AFNetworking/UIImageView+AFNetworking.h"

@interface ResultsTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *firstCategoryLabel;
@property (nonatomic, weak) IBOutlet UILabel *secondCategoryLabel;
@property (nonatomic, weak) IBOutlet UILabel *firstBrandLabel;
@property (nonatomic, weak) IBOutlet UILabel *secondBrandLabel;
@property (nonatomic, weak) IBOutlet UILabel *firstPriceLabel;
@property (nonatomic, weak) IBOutlet UILabel *secondPriceLabel;
@property (nonatomic, weak) IBOutlet UIButton *firstDiscountBtn;
@property (nonatomic, weak) IBOutlet UIButton *secondDiscountBtn;
@property (nonatomic, weak) IBOutlet UIImageView *firstShopImageView;
@property (nonatomic, weak) IBOutlet UIImageView *secondShopImageView;

- (void)loadCellWithFirstProduct:(id )firstProduct SecondProduct:(id )secondProduct AndIndexPathRow:(NSInteger )row;

@end
