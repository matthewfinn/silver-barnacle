import { Placeholders } from "../typings/placeholders" // 1
declare global {
    namespace Cypress{
        interface Chainable {
            /**
             * Get a DOM element based on placeholder value
             * @param input placeholder text value
             * @example
             * // this command
             * cy.getByPlaceholder('Your Email')
             * // will select this element
             * <input placeholder="Your Email"/>
             */
            getByPlaceholder(input: Placeholders): // 2
            Chainable<any>
        }
    }
}

Cypress.Commands.add('getByPlaceholder', 
    (input: Placeholders) => { // 3

        Cypress.log({
            displayName: 'getByPlaceholder',
            message: input,
            consoleProps() {
                return{
                    selector: input
                }
            }
        })
        return cy.get(`[placeholder="${input}"]`,
            {log:false}) // log:false just cleans up the console log

})