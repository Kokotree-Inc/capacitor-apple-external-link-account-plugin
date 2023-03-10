import { registerPlugin } from '@capacitor/core';

import type { AppleStoreKitExternalLinkAccountPlugin } from './definitions';

const AppleStoreKitExternalLinkAccount =
  registerPlugin<AppleStoreKitExternalLinkAccountPlugin>(
    'AppleStoreKitExternalLinkAccount',
    {
      web: () =>
        import('./web').then(m => new m.AppleStoreKitExternalLinkAccountWeb()),
    },
  );

export * from './definitions';
export { AppleStoreKitExternalLinkAccount };
