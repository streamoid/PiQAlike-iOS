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
 * @brief kPiQAlikeCropBackIcon -- Key used to pass crop view back icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCropBackIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCropBackIcon;

/*!
 * @brief kPiQAlikeCategorySelectIcon -- Key used to pass categoty selection icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCategorySelectIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCategorySelectIcon;

/*!
 * @brief kPiQAlikeCategoryUnSelectIcon -- Key used to pass categoty un selection icon's name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"ICON_NAME" forKey:kPiQAlikeCategoryUnSelectIcon];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeCategoryUnSelectIcon;


/*!
 * @brief kPiQAlikeBarHexColor -- Key used to pass bottom and top bar's hex color to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"COLOR_HEX" forKey:kPiQAlikeBarHexColor];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeBarHexColor;

/*!
 * @brief kPiQAlikeTextHexColor -- Key used to pass text's hex color to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"COLOR_HEX" forKey:kPiQAlikeTextHexColor];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeTextHexColor;

/*!
 * @brief kPiQAlikeTextMediumFontName -- Key used to pass medium text's font name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"System Medium" forKey:kPiQAlikeTextMediumFontName];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeTextMediumFontName;

/*!
 * @brief kPiQAlikeTextRegularFontName -- Key used to pass regular text's font name to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"System Regular" forKey:kPiQAlikeTextRegularFontName];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeTextRegularFontName;

/*!
 * @brief kPiQAlikeTextFontSize -- Key used to pass all text's font size to SDK.
 * @discussion - Use this constant as below.
 * @code
 * [dictionary setObject:@"16" forKey:kPiQAlikeTextFontSize];
 * @endCode
 */
extern NSString * _Nullable const kPiQAlikeTextFontSize;


/*!
 * @class PiQAlikeClient
 * @discussion Main class for SDK to intialize and interact with client.
 */

@interface PiQAlikeClient : NSObject

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

@end
