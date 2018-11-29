Feature: Google search

Scenario: Find Lending Front on google
  Given I go to google
   When I search for "Lending Front"
   Then the Lending Front site should be listed as first result

Scenario: Find something on google
  Given I go to google
   When I search for "asdasd1324658*.2644__#$"
   Then I expect to see some related results

