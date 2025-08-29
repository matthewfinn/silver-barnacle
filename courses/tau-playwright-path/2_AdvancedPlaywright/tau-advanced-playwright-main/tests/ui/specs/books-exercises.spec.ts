import { APIRequestContext,test } from '@playwright/test';
import BookPage from '../pages/book-page';
import pages from '../../utils/pages';
import baseAPIUrl from '../../utils/environmentBaseUrl';
import deleteBookAPIRequest from '../../api/requests/delete-books-collection';
import createBooksAPIRequest from '../../api/requests/create-books-collection';

let apiContext: APIRequestContext;
const env = process.env.ENV!;
const password = process.env.PASSWORD!;
const userId = process.env.USERID!;
const userName = process.env.APP_USERNAME!;

test.beforeAll(async ({ playwright }) => {
    // apiContext = await playwright.request.newContext({ storageState: 'storageState.json' });
    apiContext = await playwright.request.newContext({
        baseURL: baseAPIUrl[env].api,
        extraHTTPHeaders: {
            // Authorization: `Basic ${apiToken}`,
            Authorization: `Basic ${Buffer.from(`${userName}:${password}`).toString('base64')}`,
            // Authorization: `Basic ${env}`,
            Accept: 'application/json',
        },
    });
});

test.describe('Books - Fixture & API', () => {
  test('Delete a book by ISBN', async () => {
    await deleteBook(userId, "9781449325862");
  });

  test('Add list of books', async () => {
    const isbns = ['9781593277574', '9781593275846', '9781491950296', '9781491904244']

    await addAllBooksToCollection(userId, isbns);
  });
});

async function deleteBook(userId: string, isbn: string) {
  await deleteBookAPIRequest.deleteBookAPIByIsbn(apiContext, userId, isbn);
};

async function addAllBooksToCollection(userId: string, isbns: string[]) {
  await createBooksAPIRequest.addListOfBooksToCollection(apiContext, userId, isbns);
};
/*
{
  "userId": "3b93751b-bba8-442f-a52a-254c88b58767",
  "collectionOfIsbns": [
    {
      "isbn": "9781593277574"
    },
    {
      "isbn": "9781593275846"
    },
    {
      "isbn": "9781491950296"
    },
    {
      "isbn": "9781491904244"
    },
    {
      "isbn": "9781449365035"
    },
    {
      "isbn": "9781449337711"
    },
    {
      "isbn": "9781449331818"
    },
    {
      "isbn": "9781449325862"
    }
  ]
}
*/