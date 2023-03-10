#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

/**
 * The `AppleStoreKitExternalLinkAccountPlugin` class defines a Capacitor plugin that provides external link account functionality on Apple platforms using StoreKit.
 */
CAP_PLUGIN(AppleStoreKitExternalLinkAccountPlugin, "AppleStoreKitExternalLinkAccount",
           CAP_PLUGIN_METHOD(canOpen, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(open, CAPPluginReturnPromise);
)
