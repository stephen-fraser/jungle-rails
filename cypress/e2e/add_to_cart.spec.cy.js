describe("Adding Product to Cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("There is a title", () => {
    cy.get("h1").should("be.visible");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Adds a product to the cart and the cart is increased by 1", () => {
    cy.contains("My Cart (0)");
    cy.contains("Add").first().click({ force: true });
    cy.contains("My Cart (1)");
  });
});
