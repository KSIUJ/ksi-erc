# ERC

## Autorzy

- Adam Piekarczyk
- Daniel Skowroński

## Podstawowe założenia

ERC *(Electronic Registration Center | Elektroniczna Rejestracja Członków)* - to system zarządzania członkami organizacji, który powstał na potrzeby Koła Studentów Informatyki UJ *(KSI)*. Jego głównym zadaniem jest przechowywanie informacji o członkach, zarówno o aktywnych jak i o historycznych. Służy też jako baza danych dla systemu zamka elektronicznego, który też został wykonany w tym roku przez członków KSI. Oprócz tego został zaimplementowany moduł służący obsłudze kołowej biblioteki.

Cała aplikacja została wykonana we frameworku Ruby on Rails 4 z użyciem bazy danych PostgreSQL 9.4. W roku akademickim 2015/2016 została z powodzeniem wdrożona w KSI, gdzie służy jako podstawowe narzędzie administracyjne zarządu. Jest hostowana w serwerowni KSI i dostępna pod adresem http://erc.ksi.ii.uj.edu.pl.

## Opis działania

Aplikacja została pomyślana głównie jako narzędzie dla zarządu koła, dlatego większość jej funkcjonalności jest dostępna dopiero po zalogowaniu. Użytkownik anonimowy ma dostęp do przeglądu kołowej biblioteki i jej stanu aktualnego, czyli czy dana książka jest wypożyczona czy też nie. Natomiast członek zarządu koła może:

- dodać nowego członka
 
  Tabela `members` zawiera podstawowe informacje o członku, takie jak imię, nazwisko, adres email i identyfikator Elektronicznej Legitymacji Studenckiej *(ELS)*, który jest potrzebny subsystemowi zamka elektronicznego.

- dodać nowy okres

  Wprowadziliśmy pojęcie "okresu członkostwa", żeby rozwiązać problem różnych wysokości składek członkowskich w zależności od czasu zapisania oraz żeby umożliwić efektywne przechowywanie informacji o członkach już niekatywnych. W tabeli `periods` przechowujemy dane na temat tego, w jakim roku akademickim obowiązuje dany okres, krótką informację na jego temat (np. obniżenie składki o połowę, ze względu na upływ czasu od początku roku) oraz wysokość składki.

- dodać nową rolę

  Przez rolę rozumiemy funkcję, jaką w Kole można pełnić. Są to np. prezes, wiceprezes, administrator serwerowni Koła, członek komisji rewizyjnej itp.
  Dane te przechowywane są w tabeli `roles`.

- dodać nowe członkostwo

  Członkowie Koła co roku muszą ponownie zapisać się do Koła, dlatego utworzyliśmy pojęcie "członkostwa". Rozumiemy przez nie zapisanie się danego członka (model `member`) na czas trwania jednego roku akademickiego w danym okresie (model `period`). Tabela `memberships` zawiera informację na temat tego, czy dany członek uiścił składkę członkowską (tylko wtedy zamek elektroniczny pozwala mu na wejście do siedziby Koła) i czy otrzymał koszulkę kołową. Możliwe jest też dodanie nieobowiązkowego komentarza. Ostatnią bardzo ważną informacją, którą tutaj przechowujemy jest to, jaką rolę w danym roku pełni w Kole dana osoba - referencja do modelu `role`.

- dodać nową książkę do biblioteki koła

  Interesującymi danymi o książkach z naszego punktu widzenia są tytuł, nazwisko autora i wydawnictwo dlatego tylko te informację przetrzymujemy w tabeli `books`. Oczywiście autor i wydawnictwo są referencjami na osobne tabele, odpowiednio `authors` i `publishing_house`.

- oznaczyć książkę jako wypożyczoną

## Schemat bazy danych

![Schemat relacji](./erd.png)

## Dodatkowe więzy integralności

## Widoki

- `email_list` - służy do wygenerowania listy emaili wszystkich członków koła.
- `current_year_members` - służy do wyświetlenia członków, którzy w danym roku są aktywni.
- `registration_dow_statistics` - pozwala na ocenienie ilu ludzi zapisało się do koła w danym dniu.
- `undelivered_tshirts` - generuje listę członków, którzy nie otrzymali jeszcze kołowej koszulki.
- `unpaid_fees` - tworzy czarną listę osób, które zadeklarowały chęć zapisania się do koła, a nie uiściły składki członkowskiej.
- `honorable_members` - pozwala zobaczyć, kto należy do koła najdłużej. Obecny rekord wynosi 10 lat.

## Procedury / Funkcje

- `email_string` - zwraca listę mailingową członków koła jako jeden string, wygodny do przeklejenia do klienta pocztowego.
- `get_academic_year_(ending|beginning)` - zwraca rok w którym kończy się/zaczyna się dany rok akademicki.
- `insert_member_with_membership` - wstawia członka wraz z adekwatnym członkostwem.

## Triggery

- `update_creation_date` - ustawia datę utworzenia obiektu.
- `update_update_date` - ustawia datę aktualizacji obiektu.
- `crypt_password` - generuje sól i hashuje hasło użytkownika.
- `trim_email` - pozbywa się spacji, które znajdują się na początku/na końcu adresu email członka koła - przy wprowadzaniu ten błąd pojawiał się bardzo często.
- `book_availability_update` - w momencie zwrotu książki do biblioteki ustawia książkę na dostępną.

## Typowe zapytania