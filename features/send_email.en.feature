# language: en

Feature: Send an email to a friend
  In order to keep in touch with
  As web user
  I want to send an email to my friend

  Background:
    Given I choose English language

  Scenario: User entering valid information could send e-mail to a friend
    Given I go to the home page
    When I fill in "Sender name" with "Peter"
    And I fill in "Sender email" with "peter@example.com"
    And I fill in "Recipient name" with "John"
    And I fill in "Recipient email" with "john@example.com"
    And I fill in "Subject" with "Say Hello"
    And I fill in "Message" with "Have a nice day"
    And I press "Send email"
    Then I should be on the home page
    And I should see "Email sent"
    And "john@example.com" should receive 1 email with subject "Say Hello"
    When "john@example.com" opens the email with subject "Say Hello"
    Then he should see "Have a nice day" in the email body


  Scenario Outline: Send valid email to a friend
    Given I go to the home page
    When I fill in "Sender name" with "<sender_name>"
    And I fill in "Sender email" with "<sender_email>"
    And I fill in "Recipient name" with "<recipient_name>"
    And I fill in "Recipient email" with "<recipient_email>"
    And I fill in "Subject" with "<subject>"
    And I fill in "Message" with "<message>"
    And I press "Send email"
    Then I should be on the home page
    And I should see "Email sent"
    And "<recipient_email>" should receive 1 email with subject "<subject>"
    When "<recipient_email>" opens the email with subject "<subject>"
    Then he should see "<message>" in the email body

    Examples:
      | sender_name | sender_email | recipient_name |recipient_email | subject | message |
      | Apple | apple@example.com | Boby | boby@example.com | Good day | How are you |
      | Cathy | cathy@example.com | Dave | dave@example.com | Hello | How is it going |


  Scenario: User entering incomplete information could not send out e-mail
    Given I go to the home page
    When I fill in "Sender name" with "Peter"
    And I fill in "Sender email" with "peter@example"
    And I fill in "Recipient name" with "John"
    And I fill in "Recipient email" with "john@example.com"
    And I fill in "Subject" with "Say Hello"
    And I fill in "Message" with "Have a nice day"
    And I press "Send email"
    Then I should be on the home page
    And I should see "Not able to send email"
    Then "john@example.com" should receive no email


  Scenario Outline: Could not send email with incomplete information
    Given I go to the home page
    When I fill in "Sender name" with "<sender_name>"
    And I fill in "Sender email" with "<sender_email>"
    And I fill in "Recipient name" with "<recipient_name>"
    And I fill in "Recipient email" with "<recipient_email>"
    And I fill in "Subject" with "<subject>"
    And I fill in "Message" with "<message>"
    And I press "Send email"
    Then I should be on the home page
    And I should see "Not able to send email"
    Then "<recipient_email>" should receive no email

    Examples:
      | sender_name | sender_email | recipient_name |recipient_email | subject | message |
      |       | apple@example.com | Boby | boby@example.com | Good day | How are you |
      | apple | apple@example     | Boby | boby@example.com | Good day | How are you |
      | apple | apple@example     |      | boby@example.com | Good day | How are you |
      | apple | apple@example     | Boby | boby@example     | Good day | How are you |
      | apple | apple@example     | Boby | boby@example.com |          | How are you |
      | apple | apple@example     | Boby | boby@example.com | Good day |             |

