//
//  PiQAlikeClient.h
//  PiQAlike
//
//  Created by Vengal on 24/08/16.
//  Copyright © 2016 Streamoid. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @header
 * @brief PiQAlike Constants and Notifications
 * @discussion Example to use Constants - PiQAlike constants, these constants used to retieve information from the notification userInfo,for example: [notification.userInfo objectForKey:kPiQAlikeResponse]; Detailed information is provided below with each constant.
 * Example to use Notifications - PiQAlike notification name constants, these constants may be used as name values in addObserver method calls,for example: [[NSNotificationCenter defaultCenter] addObserver:self selector:\@selector(irResultsReceived:) name:kPiQAlikeClientDidReceiveResponse object:nil]; Detailed information is provided below with each notification.
 */

/*!
 * @brief DidReceiveResponse -- Dispatched when the API received response for visual search.
 */
extern NSString * _Nonnull const kPiQAlikeClientDidReceiveResponse;

/*!
 * @brief DidFailWithError -- Dispatched when the API failed to receive response for visual search.
 */
extern NSString * _Nonnull const kPiQAlikeClientDidFailWithError;

/*!
 * @brief kPiQAlikeResponse -- Key for the response of IR Data which is in kPiQAlikeClientDidReceiveResponse notification's user info.
 * @discussion - Use this constant as below.
 * @code 
 * NSArray *resultsArray = (NSArray *)[notification.userInfo objectForKey:kPiQAlikeResponse]
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeResponse;

/*!
 * @brief kPiQAlikeError -- Key for the error description of IR API which is in kPiQAlikeClientDidFailWithError notification's user info.
 * @discussion - Use this constant as below.
 * @code
 * NSString *errorInfo = (NSString *)[notification.userInfo objectForKey:kPiQAlikeError]
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeError;

/*!
 * @brief kPiQAlikeCameraCaptureIcon -- Key used to pass camera capture icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCameraCaptureIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCameraCaptureIcon;

/*!
 * @brief kPiQAlikeCameraCloseIcon -- Key used to pass camera close icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCameraCloseIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCameraCloseIcon;

/*!
 * @brief kPiQAlikeCameraGalleryIcon -- Key used to pass camera gallery icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCameraGalleryIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCameraGalleryIcon;

/*!
 * @brief kPiQAlikeCameraFlashOnIcon -- Key used to pass camera flash on icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCameraFlashOnIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCameraFlashOnIcon;

/*!
 * @brief kPiQAlikeCameraFlashOffIcon -- Key used to pass camera flash off icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCameraFlashOffIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCameraFlashOffIcon;

/*!
 * @brief kPiQAlikeCameraFlipIcon -- Key used to pass camera flip icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCameraFlipIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCameraFlipIcon;

/*!
 * @brief kPiQAlikeCategoryBackIcon -- Key used to pass category view back icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCategoryBackIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCategoryBackIcon;

/*!
 * @brief kPiQAlikeCategorySelectIcon -- Key used to pass categoty selection icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCategorySelectIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCategorySelectIcon;

/*!
 * @brief kPiQAlikeCategorySectionDownArrowIcon -- Key used to pass categoty section fown arrow icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCategorySectionDownArrowIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCategorySectionDownArrowIcon;

/*!
 * @brief kPiQAlikeCategorySectionUpArrowIcon -- Key used to pass categoty section up arrow icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCategorySectionUpArrowIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCategorySectionUpArrowIcon;

/*!
 * @brief kPiQAlikeLoaderIcon -- Key used to pass loader icon's name to SDK.
 * If value not exists it will use the UIActivityIndicatorView.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeLoaderIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeLoaderIcon;


/*!
 * @brief kPiQAlikeBarHexColor -- Key used to pass bottom and top bar's hex color to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"COLOR_HEX" forKey:kPiQAlikeBarHexColor];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeBarHexColor;

/*!
 * @brief kPiQAlikePrimaryHexColor -- Key used to pass primary's hex color to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"COLOR_HEX" forKey:kPiQAlikePrimaryHexColor];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikePrimaryHexColor;

/*!
 * @brief kPiQAlikeSecondaryHexColor -- Key used to pass secondary's hex color to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"COLOR_HEX" forKey:kPiQAlikeSecondaryHexColor];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeSecondaryHexColor;

/*!
 * @brief kPiQAlikeButtonTitleHexColor -- Key used to pass all button's title hex color to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"COLOR_HEX" forKey:kPiQAlikeButtonTitleHexColor];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeButtonTitleHexColor;

/*!
 * @brief kPiQAlikeSpinnerViewBackgroundHexColor -- Key used to pass spinner view's background hex color to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"COLOR_HEX" forKey:kPiQAlikeSpinnerViewBackgroundHexColor];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeSpinnerViewBackgroundHexColor;

/*!
 * @brief kPiQAlikePrimaryFontName -- Key used to pass primary font name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:[UIFont boldSystemFontOfSize:20] forKey:kPiQAlikePrimaryFontName];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikePrimaryFontName;

/*!
 * @brief kPiQAlikeSecondaryFontName -- Key used to pass secondary font name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:[UIFont systemFontSize:15] forKey:kPiQAlikeSecondaryFontName];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeSecondaryFontName;

/*!
 * @brief kPiQAlikeIsFreeHandCrop -- Key used to pass crop type to SDK.
 * If Yes it will enable freehand selector, else will enable rectangle selector
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:[NSNumber numberWithBool:YES] forKey:kPiQAlikeIsFreeHandCrop];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeIsFreeHandCrop;


/*!
 * @class PiQAlikeClient
 * @discussion Main class for SDK to intialize and interact with client.
 */

@interface PiQAlikeClient : NSObject

typedef void (^PiQAlikeSearchSimilarCompletionBlock) (NSString* _Nullable responseString);
typedef void (^PiQAlikeSearchSimilarFailureBlock)(NSError* _Nullable errorObj);

/*!
 * @breif This method creates a shared instance object of a PiQAlikeClient class.
 *
 * @discussion To use it, simply call @code [PiQAlikeClient sharedClient]; @endcode
 *
 * @return shared instace of a PiQAlikeClient object.
 */
+ (PiQAlikeClient * _Nullable)sharedClient;

/*!
 * @breif Used to initialize SDK for a client.
 *
 * @discussion To use it, simply call 
 * @code
 * [PiQAlikeClient initializeWithClientName:@"abz" andClientToken:@"2A232-312"];
 * @endcode
 *
 * @param clientName : Name of the client
 * @param clientToken : Token of the client, which is provided by streamoid.
 */
+ (void)initializeWithClientName:(NSString * _Nonnull)clientName andClientToken:(NSString * _Nonnull)clientToken;

/*!
 * @breif Shows the camera screen to proceed futher for visual search.
 *
 * @discussion Users of the sdk would call this method on a singleton PiQAlikeClient instance :
 * @code [[PiQAlikeClient sharedClient] showIRScreenWithDetails:dictionary]; @endcode
 *
 * @param params : List of key values pairs, which are used to customize SDK.
 */
- (void)showIRScreenWithDetails:(NSDictionary * _Nullable)params;

/*!
 * @brief Call this method to get a list of visually similar products for a particular product
 *
 * @discussion
 * Typically all of client's data is indexed by the visual search engine. So, client application can
 * just pass the productID(unique identifier for a product according to client's data) as input param
 * and in response string will passed in completionBlock. In case of failure, error object wil be passed
 * in FailureBlock
 *
 * @param inProductID : The unique identifier of the product for which visually similar products are being fetched
 * @param inCompletionBlock : When visually similar items are successfully fetched, the response Json object in string format
 *                            is passed as input param in completionBlock's argument
 * @param inFailureBlock : When fetching visually similar items fails for any reason, a NSError object is passed
 *                         in failureBlock's argument
 */
- (void)getVisuallySimilarProductsFor:(NSString* _Nonnull)inProductID withCompletionBlock:(PiQAlikeSearchSimilarCompletionBlock _Nonnull)inCompletionBlock andFailureBlock:(PiQAlikeSearchSimilarFailureBlock _Nullable)inFailureBlock;
@end
