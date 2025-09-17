export { }
import Board from '@typings/board';
declare global {
    namespace Cypress {
        interface Chainable {
            /**
             * Changes a board via API
             * @param body - changes you want to make to the board
             * @example
             * cy.editBoard(1)
             */
            editBoard: typeof editBoard
        }
    }
}

const editBoard = (body: Partial<Board> & Required<Pick<Board, 'id'>>) => {

    Cypress.log({
        displayName: 'edit board',
        consoleProps() {
            return {
                id: body.id
            }
        }
    })
    return cy.request('PATCH', `/api/boards/${body.id}`, body).its('body');
}

Cypress.Commands.add('editBoard', editBoard)