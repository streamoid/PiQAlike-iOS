//
//  ViewController.m
//  PiQAlikeTestApp
//
//  Created by Vengal on 22/08/16.
//  Copyright © 2016 Streamoid. All rights reserved.
//

#import "ViewController.h"
#import "PiQAlikeResultsListVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kPiQAlikeClientDidReceiveResponse object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kPiQAlikeClientDidFailWithError object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(irResultsReceived:) name:kPiQAlikeClientDidReceiveResponse object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(irResultsFailedWithError:) name:kPiQAlikeClientDidFailWithError object:nil];
}

- (IBAction)cameraButtonClicked:(id)sender {
    [[PiQAlikeClient sharedClient] showIRScreenWithDetails:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)irResultsReceived:(NSNotification *)notification {
    NSLog(@"%@",notification.userInfo);
    NSArray *resultsArray = (NSArray *)[notification.userInfo objectForKey:kPiQAlikeResponse];
    if (resultsArray.count == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Success" message:[resultsArray componentsJoinedByString:@"\n"] preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }

    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    PiQAlikeResultsListVC *listVc = (PiQAlikeResultsListVC *)[mainSB instantiateViewControllerWithIdentifier:@"PiQAlikeResultsListVC"];
    listVc.resultsArray = (NSArray *)[notification.userInfo objectForKey:kPiQAlikeResponse];
    [self.navigationController pushViewController:listVc animated:YES];
}

- (void)irResultsFailedWithError:(NSNotification *)notification {
    NSLog(@"%@",notification.userInfo);
    NSLog(@"%@",(NSString *)[notification.userInfo objectForKey:kPiQAlikeError]);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:(NSString *)[notification.userInfo objectForKey:kPiQAlikeError] preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
