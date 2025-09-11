import * as lists from '@fixtures/lists.json'


it('my first test', () => {
    
    // setup an interceptor for the create new list API endpoint
    cy.intercept('POST', '/api/lists')
    .as('listCreate')
    
    cy.visit('/')

    // check that the new board exists (it was created in the before function)
    cy.get('[data-cy="board-item"]')
        .realHover() // cypress-real-events function
    cy.get('h2').first().should('have.text', 'Project #1') // the heading of the first visible board should be 'Project #1'
    cy.get('[data-cy="board-item"]').first().click() // enter the board

    // create new lists from the lists.json file and verify the API call content
    lists.forEach(list =>{
        // create the list
        cy.get('[data-cy="add-list-input"]').type(`${list.name}{enter}`) // notice to use variables backticks are needed rather than regular quotes 

        // check the API call
        cy.wait('@listCreate')
            .its('response.body.order')
            .should('equal', list.order)
    })

})

// setup a new board
before(() => {
    cy.visit('/')

    cy.contains('Get started!').should('be.visible')
    cy.get('.mb-8').invoke('text')
    cy.get('.mb-8').invoke('hide') // hides the element on the page using jQuery function
    cy.contains('Get started!').should('not.be.visible')

    cy.get('.mb-8').invoke('show') // shows the element on the page using jQuery function
    cy.contains('Get started!').should('be.visible')

    cy.get('[data-cy="first-board"]')
        .type('Project #1{enter}')

    cy.get('[data-cy="board-title"]').should('have.value', 'Project #1') // needs to use 'have.value' as it's an input element
})

// reset everything
after(() => {
    cy.request('POST', '/api/reset');
    cy.visit('/');
    cy.get('[data-cy="first-board"]')
})