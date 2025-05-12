[Previous](3%20-%20Writing%20Acceptance%20Test%20in%20Cypress.md)

# Writing unit tests in Jest using React Testing Library

The first Jest unit test we will write will be exactly the same as we did for our Cypress test. We’re going to be using the same element selectors using test IDs. And again, our test will fail as the application code doesn't exist yet.

## Test Command for Jest
``npm test``

package.json shorthand added so this is actually running
``    
"test": "react-scripts test",
``

## Testing Library Key Functions
[React Testing Lib](https://testing-library.com/docs/react-testing-library/api/)

As part of our Jest test, we're going to put them in a “tests ” folder. ``src/tests``
Either ``spec`` or test will be picked up by the Jest default configuration.

## Creating a Test
We need to import React to allow us to render the component.
The ``testing-library/react`` comes with the ability to render and use the screen directly so we can navigate to the screen and access the information that we need.
The ``userEvent`` is, as I mentioned, this is how we can interact with the application as the user would.
And the ``jest-dom`` import allows us to use the Jest configuration within Testing Library.
We're going to add our ``describe`` block, and this is for our “todo add” functionality.
We're going to create our callback function and add our ``test``. This is “storing input value”.
Now we need to render our component. We can use the React Testing Library ``render``.
And we pass the component that we want it to render, which will be our ``Add`` component.
We can also use the shorthand and auto-close it.
**We don't have the Add component yet, so we need to import it.**

At this point, if we pull up the Jest, it cannot find the module, so that's your first failing test.
![chapter4-img9.png](assets/chapter4-img9.png)

Let's go ahead and add the component ``src/Add.js`` so it doesn't fail just for the file not existing. We can just add an empty function for Add.
````javascript
export default function Add() {}
````

Back in our test, make sure to reference it with the folder location — ``import Add from '../Add';``
Currently it passes because we're not providing any actions.

Now we're going to create our action using the ``userEvent``.
This has all the native commands that a user could do to interact with the page.

We're going to ``type`` some text into our input.
**How do we get our elements that we're going to type into?**


We're going to ``getByTestId``, as we know this is going to be on the page.
And this is the “todo” input, which we used within our Cypress test.
We're going to use exactly the same attribute to grab our element. And we're going to ``getByTestId``,
So, what are we going to type? We're going to type a "second todo item" as this is the second time we are doing it.

**We've got our action. Now we need to assert what the value is on the input value.**

We can ``expect``. We're going to grab the ``screen`` again after the action.
And we're going to ``getByDisplayValue`` on the screen.
And we can use a regular expression here to look for our “todo item” that we just added or input.
And we're going to expect that ``toBeInTheDocument``, with the document being the page or the component that we've just rendered.

````javascript
import React from 'react';
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import '@testing-library/jest-dom';

import Add from '../Add';

describe('todo add', () => {
    test('storing input value', async () => {
        render(<Add />);

        await userEvent.type(screen.getByTestId("todo-input"), "second todo item");

        expect(screen.getByDisplayValue(/second todo item/)).toBeInTheDocument();
    })
})
````

## Quiz
1. Which keyword do we use for test scenarios in jest?
   **test**
2. Which command is used to run jest 
    **react-scripts test**
3. Which API function can we use in Testing Library to get test ids?
    **ByTestId**
4. Which package have we **not** installed related to Testing Library?
    **dom**
5. 
## Resources
[add.spec.js](https://github.com/lewisP707/acceptance-test-driven-development-for-front-end/blob/chapter-5/src/__tests__/add.spec.js)
[Github: Chapter 4 Starting Point Code](https://github.com/lewisP707/acceptance-test-driven-development-for-front-end/releases/tag/chapter-4)
[Github: Chapter 4 Complete Code](https://github.com/lewisP707/acceptance-test-driven-development-for-front-end/releases/tag/chapter-5)
[Jest async](https://jestjs.io/docs/asynchronous#asyncawait)
[React Testing Lib](https://testing-library.com/docs/react-testing-library/api/)
[Testing Library User Event](https://testing-library.com/docs/user-event/intro/#writing-tests-with-userevent)