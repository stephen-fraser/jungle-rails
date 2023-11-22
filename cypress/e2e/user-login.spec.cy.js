describe("Login", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("Register a new user, logs them in, and logs them out", () => {
    cy.contains("Signup").first().click();
    cy.get("[id=user_first_name]").type("Job");
    cy.get("[id=user_last_name]").type("Bluth");
    cy.get("[id=user_email]").type("bestmagician@gmail.com");
    cy.get("[id=user_password]").type("password");
    cy.get("[id=user_password_confirmation]").type("password");
    cy.get("[name=commit]").click();
    cy.contains("Signed in as : Job");
    cy.contains("Logout").first().click();
  });

  it("Logs in existing user with credentials", () => {
    cy.contains("Login").first().click();
    cy.get("[id=email]").type("bestmagician@gmail.com");
    cy.get("[id=password]").type("password");
    cy.get("[name=commit]").click();
    cy.contains("Signed in as : Job");
  });
});
