// Cz. 1 - Wycieczki górskie
// Zaimportuj dane uruchamiając skrypt task2.cypher. Napisz następujące zapytania:

//    1.  Znajdź trasy którymi można dostać się z Darjeeling na Sandakphu, mające najmniejszą ilość etapów
MATCH p=shortestPath(
    (sandakphu:peak {name: 'Sandakphu'})-[*]-(darjeeling:town {name: 'Darjeeling'})
)
RETURN p

//    2.  Znajdź mające najmniej etapów trasy którymi można dostać się z Darjeeling na Sandakphu i które mogą być wykorzystywane zimą
MATCH p=shortestPath(
    (sandakphu:peak {name: 'Sandakphu'})-[*]-(darjeeling:town {name: 'Darjeeling'})
)
WHERE ALL (r IN relationships(p) WHERE r.winter = 'true')
RETURN p

//    3.  Uszereguj trasy którymi można dostać się z Darjeeling na Sandakphu według dystansu
MATCH p = (sandakphu:peak {name: 'Sandakphu'})-[r*..5]-(darjeeling:town {name: 'Darjeeling'})
RETURN p, REDUCE(darjeeling = 0, road IN r | darjeeling + road.distance) as distance
ORDER BY distance

//    4.  Znajdź wszystkie miejsca do których można dotrzeć przy pomocy roweru (twowheeler) z Darjeeling latem
MATCH p = (darjeeling:town {name: 'Darjeeling'})-[:twowheeler]->(place)
WHERE ALL (r IN relationships(p) WHERE r.summer = 'true')
RETURN p


// Cz. 2 - Połączenia lotnicze
// Zaimportuj dane uruchamiając skrypt task3.cypher. Napisz następujące zapytania:

//    5.  Uszereguj porty lotnicze według ilości rozpoczynających się w nich lotów
MATCH (a:Airport)-[o:ORIGIN]-(f:Flight)
WITH a, COUNT(o) AS c
RETURN a, c
ORDER BY c

//    6.  Znajdź wszystkie porty lotnicze, do których da się dolecieć (bezpośrednio lub z przesiadkami) z Los Angeles (LAX) wydając mniej niż 3000
MATCH p = (a:Airport {name: 'LAX'})<-[o:ORIGIN]-(f:Flight)-[od:ORIGIN|DESTINATION*]->(dest:Airport)
WITH p, REDUCE(i = 0, n IN [
    x IN NODES(p) WHERE 'Flight' IN LABELS(x)] |
    i + [(n)<-[:ASSIGN]-(ticket) | ticket.price][0]
    ) as price
WHERE price < 3000
RETURN p, price

//    7.  Uszereguj połączenia, którymi można dotrzeć z Los Angeles (LAX) do Dayton (DAY) według ceny biletów
MATCH p = (a:Airport {name: 'LAX'})<-[o:ORIGIN]-(f:Flight)-[od:ORIGIN|DESTINATION*]->(dest:Airport {name: 'DAY'})
WITH p, REDUCE(i = 0, n IN [
    x IN NODES(p) WHERE 'Flight' IN LABELS(x)] |
    i + [(n)<-[:ASSIGN]-(ticket) | ticket.price][0]
    ) as price
RETURN p, price
ORDER BY price desc

//    8.  Znajdź najtańsze połączenie z Los Angeles (LAX) do Dayton (DAY)
MATCH p = (a:Airport {name: 'LAX'})<-[o:ORIGIN]-(f:Flight)-[od:ORIGIN|DESTINATION*]->(dest:Airport {name: 'DAY'})
WITH p, REDUCE(i = 0, n IN [
    x IN NODES(p) WHERE 'Flight' IN LABELS(x)] |
    i + [(n)<-[:ASSIGN]-(ticket) | ticket.price][0]
    ) as price
RETURN p, price
ORDER BY price LIMIT 1

//    9.  Uszereguj linie lotnicze według ilości miast, pomiędzy którymi oferują połączenia (unikalnych miast biorących udział w relacjach :ORIGIN i :DESTINATION węzłów typu Flight obsługiwanych przez daną linię)
MATCH (a:Airport)<-[o:ORIGIN]-(f:Flight)-[od:ORIGIN|DESTINATION*]->(dest:Airport)
WITH f, count(DISTINCT a) AS countA, count(DISTINCT dest) AS countDest
RETURN f.airline, sum(countA + countDest)

//    10. Znajdź najtańszą trasę łączącą 3 różne porty lotnicze
MATCH p = (a1:Airport)<-[r1:ORIGIN]-(f1:Flight)-[r2:DESTINATION]->(a2:Airport)<-[r3:ORIGIN]-(f2:Flight)-[r4:DESTINATION]->(a3:Airport)
WHERE not(a1=a2) AND not(a2=a3) AND not(a1=a3)
WITH p, REDUCE(i = 0, n IN [
    x IN NODES(p) WHERE 'Flight' IN LABELS(x)] |
    i + [(n)<-[:ASSIGN]-(ticket) | ticket.price][0]
    ) as price
RETURN p, price
ORDER BY price LIMIT 1
