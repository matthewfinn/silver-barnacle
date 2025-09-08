import { expect, APIRequestContext, test } from '@playwright/test';
import baseAPIUrl from '../../utils/environmentBaseUrl';
import deleteBookAPIRequest from '../../api/requests/delete-books-collection';
import createBooksAPIRequest from '../../api/requests/create-books-collection';
import userAccountInfoAPIRequest from '../../api/requests/user-collection';
import bookData from '../../data/all-book-data';
import { UserAccountInfoResponse } from '../../data/types/user-account-info-response';

let apiContext: APIRequestContext;
const env = process.env.ENV!;
const password = process.env.PASSWORD!;
const userId = process.env.USERID!;
const userName = process.env.APP_USERNAME!;
let numBooks = 8;

test.beforeAll(async ({ playwright }) => {
    apiContext = await playwright.request.newContext({
        baseURL: baseAPIUrl[env].api,
        extraHTTPHeaders: {            
            Authorization: `Basic ${Buffer.from(`${userName}:${password}`).toString('base64')}`,
            Accept: 'application/json',
        },
    });
});

test.describe.serial.only('Books - Fixture & API', () => {
  let isbns: string[] = [];

  test('Add list of books', async () => {
    isbns = bookData.books.map(book => book.isbn);
    await addAllBooksToCollection(userId, isbns);
    const apiResponse = await getUserAccountInformation(userId);
    expect(apiResponse.books.length).toBe(numBooks);

  });

  test('Verify user account information matches local books', async () => {
    const apiResponse = await getUserAccountInformation(userId);
    const localIsbns = bookData.books.map(b => b.isbn).sort();
    const apiIsbns = apiResponse.books.map(b => b.isbn).sort();

    numBooks = apiIsbns.length;
    expect(numBooks).toBe(localIsbns.length);
    expect(apiIsbns).toEqual(localIsbns);
  });

  test('Optionally delete a book', async () => {
    // Example: delete a single book if needed
    await deleteBook(userId, "9781449325862");
    const apiResponse = await getUserAccountInformation(userId);
    expect(apiResponse.books.length).toBe(numBooks - 1);
  });
});

// Ensure cleanup even if a test fails
test.afterAll(async () => {
  try {
    console.log(`Cleaning up all books for user ${userId}...`);
    await cleanBooks(userId);

    // Verify deletion
    const apiResponse = await getUserAccountInformation(userId);
    expect(apiResponse.books.length).toBe(0);
    console.log('All books successfully cleared for user');
  } catch (err) {
    console.error('Failed to clean books:', err);
  }
});


async function deleteBook(userId: string, isbn: string) {
  await deleteBookAPIRequest.deleteBookAPIByIsbn(apiContext, userId, isbn);
};

async function addAllBooksToCollection(userId: string, isbns: string[]) {
  await createBooksAPIRequest.addListOfBooksToCollection(apiContext, userId, isbns);
};

async function getUserAccountInformation(userId: string): Promise<UserAccountInfoResponse> {
  return await userAccountInfoAPIRequest.getUserAccountInfo(apiContext, userId) as UserAccountInfoResponse;
}

async function cleanBooks(userId: string) {
    await deleteBookAPIRequest.deleteAllBooksByUser(apiContext, userId);
};