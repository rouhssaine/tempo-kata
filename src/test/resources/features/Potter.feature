Feature: Potter Store
  There was a series of 5 books about Harry Potter :
    Harry Potter and the Philosopher's Stone
    Harry Potter and the Chamber of Secrets
    Harry Potter and the Prisoner of Azkaban
    Harry Potter and the Goblet of Fire
    Harry Potter and the Order of the Phoenix
  Children all over the world thought he was fantastic, and, of course, so did the publisher.
  So in a gesture of immense generosity to mankind, (and to increase sales) they set up the following pricing model to take advantage of Harry’s magical powers.

  One copy of any of the five books costs 8 EUR.
  If, however, you buy two different books from the series, you get a 5% discount on those two books.
  If you buy 3 different books, you get a 10% discount.
  With 4 different books, you get a 20% discount.
  If you go the whole hog, and buy all 5, you get a huge 25% discount.

  Note that if you buy, say, four books, of which 3 are different titles, you get a 10% discount on the 3 that form part of a set, but the fourth book still costs 8 EUR.

  Scenario: No book in shopping basket
    Given no book in basket
    When I checkout
    Then I have nothing to pay

  Scenario Template: Has a book in shopping basket
    Given a basket of books containing :
      | <Book> |
    When I checkout
    Then I have to pay 8 €
    Examples:
      | Book                                      |
      | Harry Potter and the Philosopher's Stone  |
      | Harry Potter and the Chamber of Secrets   |
      | Harry Potter and the Prisoner of Azkaban  |
      | Harry Potter and the Goblet of Fire       |
      | Harry Potter and the Order of the Phoenix |

  Scenario: Has two different books in shopping basket and should have 5% discount
    Given a basket of books containing :
      | Harry Potter and the Philosopher's Stone |
      | Harry Potter and the Chamber of Secrets  |
    When I checkout
    Then I have to pay 15.20 €

  Scenario: Has three different books in shopping basket and should have 10% discount
    Given a basket of books containing :
      | Harry Potter and the Philosopher's Stone |
      | Harry Potter and the Chamber of Secrets  |
      | Harry Potter and the Prisoner of Azkaban |
    When I checkout
    Then I have to pay 21.60 €

  Scenario: Has four different books in shopping basket and should have 20% discount
    Given a basket of books containing :
      | Harry Potter and the Philosopher's Stone |
      | Harry Potter and the Chamber of Secrets  |
      | Harry Potter and the Prisoner of Azkaban |
      | Harry Potter and the Goblet of Fire      |
    When I checkout
    Then I have to pay 25.60 €

  Scenario: Has five different books in shopping basket and should have 25% discount
    Given a basket of books containing :
      | Harry Potter and the Philosopher's Stone |
      | Harry Potter and the Chamber of Secrets  |
      | Harry Potter and the Prisoner of Azkaban |
      | Harry Potter and the Goblet of Fire      |
      | Harry Potter and the Order of the Phoenix|
    When I checkout
    Then I have to pay 30 €

  Scenario: Has six books in shopping basket and should have 25% discount for five books
    Given a basket of books containing :
      | Harry Potter and the Philosopher's Stone |
      | Harry Potter and the Chamber of Secrets  |
      | Harry Potter and the Prisoner of Azkaban |
      | Harry Potter and the Goblet of Fire      |
      | Harry Potter and the Order of the Phoenix|
      | Harry Potter and the Order of the Phoenix|
    When I checkout
    Then I have to pay 38 €

  Scenario: Has five books (four different and one duplicate) in shopping basket and should have 20% discount for four books
    Given a basket of books containing :
      | Harry Potter and the Philosopher's Stone |
      | Harry Potter and the Chamber of Secrets  |
      | Harry Potter and the Prisoner of Azkaban |
      | Harry Potter and the Goblet of Fire      |
      | Harry Potter and the Goblet of Fire      |
    When I checkout
    Then I have to pay 33.60 €
