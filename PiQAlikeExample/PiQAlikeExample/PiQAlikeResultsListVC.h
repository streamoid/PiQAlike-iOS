//
//  PiQAlikeResultsListVC.h
//  PiQAlikeTestApp
//
//  Created by Vengal on 25/08/16.
//  Copyright © 2016 Streamoid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PiQAlikeResultsListVC : UIViewController

/**
 @brief This property stores IR results.
 */
@property (nonatomic, strong) NSArray *resultsArray;
@property (nonatomic, strong) IBOutlet UITableView *resultsTableView;

@end
