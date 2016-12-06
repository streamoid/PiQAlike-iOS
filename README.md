# PiQAlike iOS SDK Releases

This repository contains binary distributions of PiQAlike iOS framework.

If you have any questions, comments, or issues related to PiQAlike, Please contact the team by emailing support@streamoid.com.

### PiQAlike

PiQAlike is an iOS SDK for visual search recommendations in fashion. PiQAlike SDK provided by Streamoid Technologies lets you seemlessly integrate visual search feature into your native iOS applications.

- what is visual search in fashion ?
- That perfect summer dress you saw in a magazine or those shoes that the woman was wearing at the coffee shop this morning. Just take a photo and find similar products in your app using PiQAlike SDK.

### Installation

PiQAlike can be installed directly into your application by importing a framework or via CocoaPods. Quick installation instructions are provided below for reference.

##### CocoaPods Installation:

The recommended path for installation is CocoaPods. CocoaPods provides a simple, versioned dependency management system that automates the tedious and error prone aspects of manually configuring libraries and frameworks. You can add PiQAlike to your project via CocoaPods by doing the following :

```sh
$ sudo gem install cocoapods
$ pod setup
```
Now create a Podfile in the root of your project directory and add the following:
```sh
pod 'PiQAlike'
```
Complete the installation by executing:
```sh
$ pod install
```
These instructions will setup your local CocoaPods environment and import PiQAlike into your project. Once this has completed, test your installation by referring to the Verifying PiQAlike Configuration section below.

##### Framework Installation
Download the appropriate build artifact from this repository and add it to your application:

- Drag and drop the framework onto your project, instructing Xcode to copy items into your destination group's folder.
- Add run script phase to build phase: 
- Go to "Build Phase" section of your target settings.
- Click on the + button in the top left and select New Run Script Phase.
- In the script text input box paste the following snippet:

``` bash ${SRCROOT}/PiQAlike.framework/strip-framework.sh```

Build and run your project to verify installation was successful. Once you have completed a successful build, refer to the Verifying PiQAlike Configuration section below for details on how to test your setup.

### Configuration
- Disable App Transport Security(ATS) to support http : 
- In iOS9 and Xcode 7, Apple requires that all network connections use https. This will block some of the http connections we are making inside framework. So, the following must be added to your info.plist file to support http connections:
```sh 
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>
```
- Enable permission to support camera and photo library : 
- In iOS10 and Xcode 8, Apple requires permission to use came and photo library. So, the following must be added to your info.plist filte to use camera and photo library:
```sh 
<key>Privacy - Camera Usage Description</key>
<value>Uses Camera </value>

<key>Privacy - Photo Library Usage Description</key>
<value>Uses Photo Library </value>
```

### Verifying PiQAlike Configuration

Once you have finished installing PiQAlike via CocoaPods or framework, you can test your configuration by importing the headers and connecting a client to the PiQAlike cloud. To do so, edit your application delegate to include the code below (note that you must substitute the client name and client token placeholder text with your actual values, in order to get these values please contact us at support@streamoid.com):

```sh
#import <PiQAlike/PiQAlike.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
[PiQAlikeClient initializeWithClientName:CLIENT_NAME andClientToken:CLIENT_TOKEN];
}
```
Launch your application and verify that the connection is successful. You are now ready to begin visual search.

### Contact

You can reach the Streamoid team at any time by emailing support@streamoid.com.
