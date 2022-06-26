@LoginPage
Feature: Home Page

  @Check
  Scenario: Check Login Page
    Given LcWaikiki is on Home page
    When click "Üye Ol" card in the top rigt
    Then should see Login Page

  @Email @Components
  Scenario: Check Email Components
    Given LcWaikiki is on Login Page
    When click "E-Posta" radio button
    Then should see "Üye Ol" title
    Then should see "E-Posta" radio button
    Then should see "Telefon" radio button
    Then should see "E-Posta Adresi" text on Email
    Then should see "Şifre" text on Password
    Then should see Show Password Icon
    Then should see "Üye Ol" login button

  @Empty
  Scenario Outline: Empty Login
    Given LcWaikiki is on Login Page
    When click login button
    Then should see "<emailErr>" Email Empty message
    Then should see "<passErr>" Password Empty message
    Examples:
      | emailErr                           | passErr                   |
      | Lütfen e-posta adresinizi giriniz. | Lütfen şifrenizi giriniz. |

  @Empty @Password
  Scenario Outline: Empty Password
    Given LcWaikiki is on Login Page
    When type Email "<email>"
    When click login button
    Then should see "<passErr>" Password Empty message
    Then should not see Email Empty message
    Examples:
      | email                 | passErr                   |
      | elifgokce@outlook.com | Lütfen şifrenizi giriniz. |

  @Empty @Email
  Scenario Outline: Empty Email
    Given LcWaikiki is on Login Page
    When type Password "<pass>"
    When click login button
    Then should see "<emailErr>" Email Empty message
    Then should not see Password Empty message
    Examples:
      | pass       | emailErr                           |
      | 123456     | Lütfen e-posta adresinizi giriniz. |

  @False @Password
  Scenario Outline: False Email
    Given LcWaikiki is on Login Page
    When type Email "<email>" and click login
    Then should see "<passErr>" Email False message
    Examples:
      | email                 | passErr                                    |
      | elifgokce@outlook.com | Lütfen geçerli bir e-posta adresi giriniz. |

  @FalseLogin
  Scenario Outline: False Login
    Given LcWaikiki is on Login Page
    When type Email "<email>", Password "<password>" and click login
    Then should see "<err>" Login Error message
    Examples:
      | email                 | password | err                                                       |
      | elifgokce@outlook.com | 123      | Lütfen E-posta Adresinizi ya da Şifrenizi Kontrol Ediniz. |