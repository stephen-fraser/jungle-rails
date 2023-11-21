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

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
