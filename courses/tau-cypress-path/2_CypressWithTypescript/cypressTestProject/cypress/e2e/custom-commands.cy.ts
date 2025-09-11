it.only('create a new board', () => {

    cy.visit('/')

    // checks placeholder value
    cy.get('[data-cy="first-board"]')
        .should('have.attr', 'placeholder', 'Name of your first board')

    // Alternative way to get the same element using placeholder attributes value
    cy.get('[placeholder="Name of your first board"]')

    // using custom command defined in cypressTestProject\cypress\support\commands\getByPlaceholder.ts
    cy.getByPlaceholder('Name of your first board')

})

// reset everything
after(() => {
    cy.request('POST', '/api/reset');
    cy.visit('/');
    cy.get('[data-cy="first-board"]')
})