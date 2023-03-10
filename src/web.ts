import { WebPlugin } from '@capacitor/core';

import type { AppleStoreKitExternalLinkAccountPlugin } from './definitions';

export class AppleStoreKitExternalLinkAccountWeb
  extends WebPlugin
  implements AppleStoreKitExternalLinkAccountPlugin
{
  canOpen(): Promise<{ value: boolean }> {
    throw new Error('Method not implemented.');
  }
  open(): Promise<void> {
    throw new Error('Method not implemented.');
  }
}
