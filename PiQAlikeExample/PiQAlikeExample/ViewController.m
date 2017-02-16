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
@property (weak, nonatomic) IBOutlet UITextField *productIdTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kPiQAlikeClientDidReceiveResponse object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kPiQAlikeClientDidFailWithError object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(irResultsReceived:) name:kPiQAlikeClientDidReceiveResponse object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(irResultsFailedWithError:) name:kPiQAlikeClientDidFailWithError object:nil];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)]];
}

- (IBAction)cameraButtonClicked:(id)sender {
    [[PiQAlikeClient sharedClient] showIRScreenWithDetails:nil];
}

- (IBAction)customCameraButtonClicked:(id)sender {
    [[PiQAlikeClient sharedClient] showIRScreenWithDetails:@{kPiQAlikeCameraCaptureIcon : @"icon_camera", kPiQAlikeCameraCloseIcon : @"icon_close", kPiQAlikeCameraGalleryIcon : @"icon_gallery", kPiQAlikeCameraFlashOnIcon : @"icon_flash_on", kPiQAlikeCameraFlashOffIcon : @"icon_flash_off", kPiQAlikeCameraFlipIcon : @"icon_flip", kPiQAlikeCategoryBackIcon : @"icon_back", kPiQAlikeCategorySelectIcon : @"check_select", kPiQAlikeBarHexColor : @"#42f4c5", kPiQAlikePrimaryFontName : [UIFont boldSystemFontOfSize:20.0],  kPiQAlikeSecondaryFontName : [UIFont systemFontOfSize:15.0], kPiQAlikeSpinnerViewBackgroundHexColor : @"#ffffff", kPiQAlikeLoaderIcon : @"icon_refresh", kPiQAlikeIsFreeHandCrop : [NSNumber numberWithBool:YES]}];
}


- (IBAction)similarBtnAction:(id)sender {
    UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    if (self.productIdTextField.text.length > 0) {
        [self.view addSubview:spinner];
        [spinner setCenter:self.view.center];
        [self.view bringSubviewToFront:spinner];
        [spinner startAnimating];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [[PiQAlikeClient sharedClient] getVisuallySimilarProductsFor:self.productIdTextField.text
                                                     withCompletionBlock:^(NSString * _Nullable responseString) {
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             [spinner stopAnimating];
                                                             
                                                             NSDictionary* responseDict = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
                                                             NSArray* productsArr = (NSArray*)responseDict[@"data"];
                                                             if([productsArr isKindOfClass:[NSArray class]]){
                                                                 
                                                                 if(productsArr.count > 0){
                                                                     UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                                                                     PiQAlikeResultsListVC *listVc = (PiQAlikeResultsListVC *)[mainSB instantiateViewControllerWithIdentifier:@"PiQAlikeResultsListVC"];
                                                                     listVc.resultsArray = productsArr;
                                                                     [self.navigationController pushViewController:listVc animated:YES];
                                                                 }else{
                                                                     UIAlertController* alertVC = [self getAlertControllerWithTitle:@"Error" andMessage:@"Zero products found" withBtnTitle:@"OK"];
                                                                     [self presentViewController:alertVC animated:YES completion:nil];
                                                                 }
                                                                 
                                                             }
                                                         });
                                                         
                                                         
                                                     } andFailureBlock:^(NSError * _Nullable errorObj) {
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             
                                                             [spinner stopAnimating];
                                                             UIAlertController* alertVC = [self getAlertControllerWithTitle:@"Error" andMessage:@"Something went wrong" withBtnTitle:@"OK"];
                                                             [self presentViewController:alertVC animated:YES completion:nil];
                                                         });
                                                     }];
        });
        
    }else{
        UIAlertController* alertVC = [self getAlertControllerWithTitle:@"Alert" andMessage:@"Enter product Id" withBtnTitle:@"OK"];
        [self presentViewController:alertVC animated:YES completion:nil];
    }
    
    
}

- (IBAction)outfitterBtnAction:(id)sender {
    UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    if (self.productIdTextField.text.length > 0) {
        [self.view addSubview:spinner];
        [spinner setCenter:self.view.center];
        [self.view bringSubviewToFront:spinner];
        [spinner startAnimating];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [[PiQAlikeClient sharedClient] getOutfitsFor:self.productIdTextField.text
                                     withCompletionBlock:^(NSString * _Nullable responseString) {
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             [spinner stopAnimating];
                                             NSDictionary* responseDict = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
                                             
                                             NSArray* outfitsArr = (NSArray*) responseDict[@"data"];
                                             if(outfitsArr.count > 0){
                                                 UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                                                 PiQAlikeResultsListVC *listVc = (PiQAlikeResultsListVC *)[mainSB instantiateViewControllerWithIdentifier:@"PiQAlikeResultsListVC"];
                                                 listVc.resultsArray = outfitsArr;
                                                 [self.navigationController pushViewController:listVc animated:YES];
                                             }else{
                                                 UIAlertController* alertVC = [self getAlertControllerWithTitle:@"Error" andMessage:@"Zero outfits found" withBtnTitle:@"OK"];
                                                 [self presentViewController:alertVC animated:YES completion:nil];
                                             }
                                         });
                                     } andFailureBlock:^(NSError * _Nullable errorObj) {
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             [spinner stopAnimating];
                                         });
                                     }];
        });
        
    }else{
        UIAlertController* alertVC = [self getAlertControllerWithTitle:@"Alert" andMessage:@"Enter product Id" withBtnTitle:@"OK"];
        [self presentViewController:alertVC animated:YES completion:nil];
    }
    
    
}

- (void)tapped:(UIGestureRecognizer*)inGestureRecognizer{
    [self.view endEditing:YES];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)irResultsReceived:(NSNotification *)notification {
    NSLog(@"%@",notification.userInfo);
    NSDictionary *filters = (NSDictionary *)[notification.userInfo objectForKey:kPiQAlikeFiltersApplied];
    NSLog(@"Filters applied : %@",filters);
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

#pragma mark - getAlertView

- (UIAlertController*)getAlertControllerWithTitle:(NSString*)inTitle andMessage:(NSString*)inMessage withBtnTitle:(NSString*)inOkBtnTitle{
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:inTitle message:inMessage preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:inOkBtnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertVC dismissViewControllerAnimated:YES completion:nil];
    }]];
    return alertVC;
}


@end
