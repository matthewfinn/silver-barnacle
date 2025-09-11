describe('testing types from source', () => {
    it('adding a new board', () => {
        cy.addBoard('API Board')
            .then((body) => {
                expect(body.id).to.exist
                expect(body.id).to.equal(1)
                expect(body.name).to.equal('API Board')
                expect(body.user).to.equal(0)
                expect(body.starred).to.equal(false)
                expect(body.user).to.equal(0)
                expect(body.created).to.equal(new Date().toISOString().split('T')[0]) // toISOString() returns something like "2025-09-11T14:30:00.000Z". split('T')[0] extracts just the date part.
            })
        /* yielded object example
            {
                "name": "API Board",
                "user": 0,
                "starred": false,
                "created": "2025-09-11",
                "id": 1
            }
        */

    })
})

after(() => {
    cy.request('POST', '/api/reset'); // reset everything
    cy.visit('/');
    cy.get('[data-cy="first-board"]')
})