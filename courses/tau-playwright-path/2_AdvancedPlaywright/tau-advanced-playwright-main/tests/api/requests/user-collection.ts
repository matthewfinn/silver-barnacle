import { APIRequestContext } from '@playwright/test';
import { buildUrl } from '../../utils/apiUrlBuilder';
import { executeRequest } from '../../utils/apiRequestUtils';
import endpoints from '../../utils/apiEndpoints';
import methods from '../../utils/apiMethods';
import { UserAccountInfoResponse } from '../../data/types/user-account-info-response';

async function getUserAccountInfo(apiContext: APIRequestContext, userId: string): Promise<UserAccountInfoResponse> {
  const method = methods.get;
  const requestOptions = {};
  const requestUrl = buildUrl(endpoints.account.get, userId);
  const response = await executeRequest(apiContext, requestUrl, method, requestOptions);
  // Parse JSON from API Response
  const data = await response.json();
  return data as UserAccountInfoResponse;
}

export default { getUserAccountInfo };
