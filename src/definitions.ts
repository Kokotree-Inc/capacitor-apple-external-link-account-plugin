/**
 * Defines the methods that can be used to interact with the external link account functionality using StoreKit on Apple platforms.
 */
export interface AppleStoreKitExternalLinkAccountPlugin {
  /**
   * Determines if the app can open the external link account functionality.
   * Resolves with `value` === `true` if the functionality is available, `false` otherwise.
   */
  canOpen(): Promise<{ value: boolean }>;

  /**
   * Presents a continuation sheet that enables people to choose whether to open your app’s link to an external website for account creation or management.
   * Throws an exception if the external link account functionality is not available or if the continuation sheet is not available.
   */
  open(): Promise<void>;
}
