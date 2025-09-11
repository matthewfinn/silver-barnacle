describe('testing dashboard', () => {
  it('adding a new board', () => {
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
})

after(() => {
  cy.request('POST', '/api/reset'); // reset everything
  cy.visit('/');
  cy.get('[data-cy="first-board"]')
})