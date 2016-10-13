//
//  PiQAlikeResultsListVC.m
//  PiQAlikeTestApp
//
//  Created by Vengal on 25/08/16.
//  Copyright © 2016 Streamoid. All rights reserved.
//

#import "PiQAlikeResultsListVC.h"
#import "ResultsTableViewCell.h"

#define kListItemsCellReUseIdentifier  @"list_items_re_use_identifier"

@implementation PiQAlikeResultsListVC

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.resultsArray.count/2) + (self.resultsArray.count % 2);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 205;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ResultsTableViewCell *cell = (ResultsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kListItemsCellReUseIdentifier forIndexPath:indexPath];
    
    NSInteger firstIndex = indexPath.row*2;
    id firstObject = nil;
    if (self.resultsArray.count > firstIndex) {
        firstObject = [self.resultsArray objectAtIndex:firstIndex];
        
        NSInteger secondIndex = firstIndex + 1;
        if (self.resultsArray.count > secondIndex) {
            id secondObject = [self.resultsArray objectAtIndex:secondIndex];
            [cell loadCellWithFirstProduct:firstObject SecondProduct:secondObject AndIndexPathRow:indexPath.row];
        } else {
            [cell loadCellWithFirstProduct:firstObject SecondProduct:nil AndIndexPathRow:indexPath.row];
        }
    }
    
    return cell;
    
}


@end
