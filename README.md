# AppSell iOS SDK


### Install with CocoaPods
In your `Podfile`, add
```
pod 'AppSellSDK'
```
and run 
```
pod update
```
This installs AppSell SDK as a framework. Declare `import AppSellSDK` in your swift file to use the library.


### Objective C support
SDK is written in swift. If your app doesn't contain any swift code yet, you should set **Always Embed Swift Standard Libraries** complier option on **Build Settings** page to **Yes**.


### Setup URL schema of Your Application

You need to setup a url-schema for your application, which looks like app-APP_ID (e.g. **app-abc12345-abcd-1234-abcd-123456abcdef**).

[How to register your own URL Scheme.](https://developer.apple.com/documentation/uikit/core_app/allowing_apps_and_websites_to_link_to_your_content/defining_a_custom_url_scheme_for_your_app)


### Pass urls to SDK
Add url hooks to `application:openURL:options:` method in AppDelegate:
```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    AppSellSDK.processOpenURL(url)
    return true
}
```

Or in Objective C:
```objc
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    [AppSellSDK processOpenURL:url];   
    return YES;
}
```


### Init SDK

Before any other actions you need to init SDK with your app ID:
```swift
let appID = "abc12345-abcd-1234-abcd-123456abcdef"

AppSellSDK.initApp(with: appID) { (error: Error?) in
    if let error = error {
        print("Error! \(error.localizedDescription)")
    } else {
        print("Success!")
    }
}
```

Or in Objective C:
```objc
NSString* appID = @"abc12345-abcd-1234-abcd-123456abcdef";

[AppSellSDK initAppWith:appID completion:^(NSError * _Nullable error) {
    if (error != nil ) {
        NSLog(@"Error! %@", error.localizedDescription);
    } else {
        NSLog(@"Success1");
    }
}];
```


### Send events

```swift
AppSellSDK.sendEvent("event_name") { (error) in
    if let error = error {
        print("Error! \(error.localizedDescription)")
    } else {
        print("Success!")
    }
}
```

Or in Objective C:
```objc
[AppSellSDK sendEvent:@"event_name" completion:^(NSError * _Nullable error) {
    if (error != nil ) {
        NSLog(@"Error! %@", error.localizedDescription);
    } else {
        NSLog(@"Success1");
    }
}];
```

That's all!
