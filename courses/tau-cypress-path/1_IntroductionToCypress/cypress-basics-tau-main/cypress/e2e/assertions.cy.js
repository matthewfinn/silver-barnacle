it('making assertions', () => {
    cy.visit('/board/1')

    cy.get('[data-cy=new-card]')
        .click()

    cy.get('[data-cy="new-card-input"]')
        .type('bread{enter}')

    cy.get('[data-cy="new-card-input"]')
        .type('milk{enter}')

    cy.get('[data-cy="card"]')
        .should('be.visible')
        .should('have.length', 2)

    cy.get('[data-cy="card-checkbox"]')
        .first()
        .check() // opposite is .uncheck(), these guarantee state rather than relying on .click()

    cy.get('[data-cy="due-date"]')
        .should('have.class', 'completed')

    cy.get('[data-cy="card-checkbox"]')
        .first()
        .should('be.visible')
        .should('be.checked')

    cy.get('[data-cy="list-name"]').should('have.value', 'shopping list') // needs to use 'have.value' as it's an input element

    cy.get('[data-cy="card-text"]').first().should('have.text', 'bread') // can use 'have.text' as it's a div element

})

after(() => {
    cy.request('DELETE', '/api/cards')
    cy.reload()
    cy.get('[data-cy="card"]')
        .should('not.exist')
})