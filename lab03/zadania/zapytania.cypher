// 1. Wszystkie filmy
MATCH (movies:Movie)
RETURN movies

// 2. Wszystkie filmy, w których grał Hugo Weaving 
MATCH (hugo:Person {name: "Hugo Weaving"})-[:ACTED_IN]->(hugoMovies)
RETURN hugoMovies

// 3. Reżyserzy filmów, w których grał Hugo Weaving 
MATCH (hugo:Person {name: "Hugo Weaving"})-[:ACTED_IN]->(hugoMovies)<-[:DIRECTED]-(directors)
RETURN directors

// 4. Wszystkie osoby, z którymi Hugo Weaving grał w tych samych filmach 
MATCH (hugo:Person {name: "Hugo Weaving"})-[:ACTED_IN]->(hugoMovies)<-[:ACTED_IN]-(hugoCoActors)
RETURN hugoCoActors

// 5. Wszystkie filmy osób, które grały w Matrix
MATCH (matrixMovie:Movie {title: "The Matrix"})<-[:ACTED_IN]-(matrixActors)-[:ACTED_IN]->(moviesOfMatrixActors)
RETURN moviesOfMatrixActors

// 6. Listę aktorów (aktor = osoba, która grała przynajmniej w jednym filmie) wraz z ilością filmów, w których grali 
MATCH (actors)-[:ACTED_IN]->(movies)
RETURN actors, count(movies)

// 7. Listę osób, które napisały scenariusz filmu, które wyreżyserowały wraz z tytułami takich filmów (koniunkcja – ten sam autor scenariusza i reżyser) 
MATCH (writers:Person)-[:WROTE]->(movies)<-[:DIRECTED]-(directors)
WHERE writers.name = directors.name
RETURN writers, movies.title

// 8. Listę filmów, w których grał zarówno Hugo Weaving jak i Keanu Reeves 
MATCH (hugo)-[:ACTED_IN]->(movies:Movie)<-[:ACTED_IN]-(keanu)
WHERE hugo.name = "Hugo Weaving" AND keanu.name = "Keanu Reeves"
RETURN movies

// 9. (za 0.2pkt)
//    Zestaw zapytań powodujących uzupełnienie bazy danych o film Captain America: The First Avenger
//    wraz z uzupełnieniem informacji o reżyserze, scenarzystach
//    i odtwórcach głównych ról (w oparciu o skrócone informacje z IMDB - http://www.imdb.com/title/tt0458339/)
//    + zapytanie pokazujące dodany do bazy film wraz odtwórcami głównych ról, scenarzystą i reżyserem.
//    Plik SVG ma pokazywać wynik ostatniego zapytania.
// movie
CREATE (CaptainAmericaTheFirstAvenger:Movie {title: 'Captain America: The First Avenger', released: 2011, tagline: 'When patriots become heroes'})
// director
CREATE (JoeJohnston:Person {name: 'Joe Johnston', born: 1950})
// screenwriters
CREATE (ChristopherMarkus:Person {name: 'Christopher Markus', born: 1970})
CREATE (StephenMcFeely:Person {name: 'Stephen McFeely', born: 1970})
// cast
CREATE (ChrisEvans:Person {name: 'Chris Evans', born: 1981})
CREATE (HayleyAtwell:Person {name: 'Hayley Atwell', born: 1982})
CREATE (SamuelJackson:Person {name: 'Samuel L. Jackson', born: 1948})
// associations
CREATE
  (ChrisEvans)-[:ACTED_IN {roles:['Captain America / Steve Rogers']}]->(CaptainAmericaTheFirstAvenger),
  (HayleyAtwell)-[:ACTED_IN {roles:['Peggy Carter']}]->(CaptainAmericaTheFirstAvenger),
  (SamuelJackson)-[:ACTED_IN {roles:['Nick Fury']}]->(CaptainAmericaTheFirstAvenger),
  (JoeJohnston)-[:DIRECTED]->(CaptainAmericaTheFirstAvenger),
  (ChristopherMarkus)-[:WROTE]->(CaptainAmericaTheFirstAvenger),
  (StephenMcFeely)-[:WROTE]->(CaptainAmericaTheFirstAvenger)

MATCH (actors)-[:ACTED_IN]->(movie:Movie {title: "Captain America: The First Avenger"})
MATCH (screenwriters)-[:WROTE]->(movie:Movie {title: "Captain America: The First Avenger"})
MATCH (directors)-[:DIRECTED]->(movie:Movie {title: "Captain America: The First Avenger"})
RETURN movie, actors, directors, screenwriters
