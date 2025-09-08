import {
    cardsLoadRandomly,
    cardsLoadSlowly,
    cancelInterceptors
} from '../../evilCode'


before(() => {
    cy.visit('/board/1')

    // Create a new list
    cy.get('[data-cy=add-list-input]').type('grocery store{enter}')
    cy.get('[data-cy=new-card]').first()
        .click()
    cy.get('[data-cy=new-card-input]').first()
        .type('bread{enter}')
    cy.get('[data-cy=new-card-input]').first()
        .type('milk{enter}')

    // Add a 2nd new list
    cy.get('[data-cy=create-list]').click()
    cy.get('[data-cy=add-list-input]').type('chemist{enter}')
    cy.get('[data-cy=new-card]').last()
        .click()
    cy.get('[data-cy=new-card-input]').last().type('paracetemol{enter}')


})


it('date formatting', () => {

    //Get today's date and add 3 days - default due date on cards is 3 days from when it's created
    const today = new Date();
    today.setDate(today.getDate() + 3); // Add 3 days

    //Format as 'MMM DD YYYY' (e.g., Sep 15 2025)
    const options = {
        month: 'short',
        day: '2-digit',
        year: 'numeric'
    };

    const formattedDate = today
        .toLocaleDateString('en-US', options)
        .replace(',', ''); // Remove comma to match format

    cy.visit('/board/1')

    cy.get('[data-cy=card]')
        .should('be.visible')
        .should('have.length', 3)

    cy.get('[data-cy=list]')
        .eq(0) // first element
        .contains('[data-cy=card]', formattedDate)

})

it('cards load slowly', {
    defaultCommandTimeout: 6000
}, () => {
    cy.visit('/board/1')
    cardsLoadSlowly(5000)
    cy.get('[data-cy=card]', {
        timeout: 6500
    })
})

it('check card contents', () => {
    cy.visit('/board/1')
    cy.get('[data-cy=card]', {
            timeout: 3000
        }) // timeout here was just to test if cancelInterceptors() worked, it did
        .last()
        .click()

    cy.get('[data-cy=card-detail-title]')
        .should('have.value', 'paracetemol')
})


it('cards load randomly', () => {
    cy.visit('/board/1')
    cardsLoadRandomly(4000)
    cy.get('[data-cy=card]').last()
        .click()

    cy.get('[data-cy=card-detail-title]')
        .should('have.value', 'milk')

})

afterEach(() => {
    cancelInterceptors()
})

after(() => {
    cy.request('DELETE', '/api/lists')
    cy.visit('/board/1')
    cy.get('[data-cy=card]')
        .should('not.exist')
})