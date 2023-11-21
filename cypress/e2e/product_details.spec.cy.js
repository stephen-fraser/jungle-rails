describe("Home page", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("There is a title", () => {
    cy.get("h1").should("be.visible");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("navigates to the first products product page", () => {
    cy.get(".products article").first().click();
    cy.url().should("include", "/products/2");
    cy.get(".product-detail").should("be.visible");
  });
});
