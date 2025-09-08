export const cardsLoadRandomly = (delay) => {
  cy.intercept({
    url: /api\/cards\?listId=/,
    middleware: true,
  }, (req) => {
    req.reply(res => {
      res.delay = Math.floor(Math.random() * delay);
    })
  }).as('😈')
}

export const cardsLoadSlowly = (delay) => {
  cy.intercept({
    url: /api\/cards\?listId=/,
    middleware: true,
  }, ({ reply }) => {
    reply( (res) => {
      res.delay = delay
    })
  }).as('😈')
}

// Reset the interceptors (cancel them)
export const cancelInterceptors = () => {
  // Cypress doesn't have a direct "remove" function, so we override
  cy.intercept(
    {
      url: /api\/cards\?listId=/,
    },
    (req) => {
      req.continue(); // Let the request pass through with no delay or modification
    }
  ).as('cardsDefault');
};