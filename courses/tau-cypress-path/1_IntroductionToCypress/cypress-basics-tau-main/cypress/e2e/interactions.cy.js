it('create a new list & a new card', () => {
  cy.visit('/board/1')
  cy.get('[data-cy="add-list-input"]')
    .type('test list{enter}') // {enter} presses the enter key after typing 'test list'
  cy.contains('Add another card')
    .click()
  cy.get('[data-cy="new-card-input"]')
    .type('test card{enter}') 
})

it.only('new test', () => {
  cy.visit('/')
  cy.get('[data-cy="star"]') // by attribute name
    .first() // uses the first element found
    .click({force: true}) //forces the click even if the element is not currently visible 
  cy.get('.star') // by class name
});

