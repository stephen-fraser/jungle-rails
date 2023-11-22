describe("Product Details Page", () => {
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

  it("navigates to the first products product page", () => {
    cy.get(".products article").first().click();
    cy.url().should("include", "/products/2");
    cy.get(".product-detail").should("be.visible");
  });
});
