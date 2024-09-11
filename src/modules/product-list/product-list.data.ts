/*!
 * Copyright (c) Microsoft Corporation.
 * All rights reserved. See LICENSE in the project root for license information.
 */
import { AsyncResult, FeatureState } from '@msdyn365-commerce/retail-proxy';

export interface IProductListData {
    featureState: AsyncResult<FeatureState[]>;
}
