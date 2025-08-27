


## Chapter 2 - Exercises

1. Implement a new test using dynamic page object for the Forms page (https://demoqa.com/automation-practice-form). Note that this page doesn't require a sign in, so you'll need to have it covered. What changes in the existing code you had to make? How did you handle the buildUrl strategy?

2. Implement a new test using fixture for the search at the Book Store page (https://demoqa.com/books). Explore scenarios for 1 single result ("You Don't Know JS"), multiple results ("java") and no results ("playwright"). How easy was to implement those multiple scenarios? Is the code easy to understand? Do you considere the use of fixtures for this scenario a good strategy?

3. Implement a new test using fixture for the search at the Book Store page (https://demoqa.com/books). Explore scenarios for 1 single result ("You Don't Know JS"), multiple results ("java") and no results ("playwright"). Explore the use of params too. How easy was to implement those multiple scenarios? Is the code easy to understand? Do you considere the use of fixtures for this scenario a good strategy?

## Chapter 3 - Exercises

1. Implement a new test for "delete 1 book from the collection" (https://demoqa.com/profile) using the existing `deleteBookAPIByIsbn` in [delete-books-collection.ts](/tests/api/requests/delete-books-collection.ts). How easy was to use that existing method? What challenges did you have to implement the test? Did you use the swagger docs at all? Did you need to make any changes for the method to work?

2. Implement a new test for "add list of books to collection" (this is not available in the UI, only via API) - Here is the [swagger doc](https://demoqa.com/swagger/#/BookStore/BookStoreV1BooksPost:~:text=Description-,addListOfBooks,-*). How easy was to use the standard methodology? What challenges did you have to implement the test? How did you handle the buildUrl strategy? Was the error handling implementation usefull at all?

## Chapter 4 - Exercises

1. If you haven't yet, update your newly created tests (Exercise 2.1, 2.3, 2.4, 3.1, 3.2) to use JSON. What are the be benefits of using this approach? Is there any other approach you'd use for these scenarios?

2. Choose one of the scenarios and update it to use a CSV file. Where there any advantages from the coding perspective in using this approach? How about the advantages in terms of test runtime, which approach is the fastest?

3. Implement a test to perform a sort or a search using HTTPS interception for the Books List page (https://demoqa.com/books) - Here is the [swagger doc](https://demoqa.com/swagger/#/BookStore/BookStoreV1BooksGet:~:text=v1/Books-,Parameters,-Try%20it%20out). Do you consider this approach appropriate for this scenario? Why would you not use it?

## Chapter 5 - Exercises

1. Integrate visual regression tests with Applitools with the [profile-api-interception.spec.ts](/tests/ui/specs/profile-api-interception.spec.ts) and choose the ideal check settings strategy for this test. What option did you pick? Is there be a second option you'd use?
2. Run one of the tests that has visual regression to a different user. What problems did you notice. How would you solve them?

## Chapter 6 - Exercises

1. If you are working on a project, regardless the testing framework your team is using, idetify the stages of your pipeline. 
    1. How long each stage is taking? 
    2. Is there any job or stage that can be pararelized to speed up the pipeline? 
    3. Are the tests using any pararelization strategy? 
    4. Are the end-to-end/ui tests blocking the deployment?
    5. Is there any communication (email to the team or job's result posted in a communication tool such as Slack or Microsoft Teams) being sent?
    6. How often does the build fail and it's noticed only after hours/days?
1. If you are already using playwright, are you using any sharding strategy? How often do you need to revisit that setup to keep it efficient?



___

💡 Share on LinkedIn something interesting you've learned! Don't forget to tag me [Renata Andrade](https://www.linkedin.com/in/raptatinha/).

💜 If you have questions, feel free to post them on [github](https://github.com/raptatinha/tau-advanced-playwright/issues).

Happy Testing 🎭