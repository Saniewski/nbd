#!/bin/bash

# 1. Umieść w bazie (nazwa bucketa ma być Twoim numerem indeksu poprzedzonym literą „s”) 5 wartości, gdzie każda z nich ma być dokumentem json mającym 4 pola co najmniej dwóch różnych typów.
##1.0
curl http://localhost:8098/types/default/buckets/s16996/props \
    -i -v -X PUT \
    --header 'Content-Type: application/json' \
    --data '{"props":{}}'

##1.1
curl http://localhost:8098/types/default/buckets/s16996/keys/zapytanie1-1?returnbody=true \
    -i -v -X PUT \
    --header 'Content-Type: application/json' \
    --data '{"firstName": "John", "lastName": "Doe", "age": 24, "isEmployed": true}'

##1.2
curl http://localhost:8098/types/default/buckets/s16996/keys/zapytanie1-2?returnbody=true \
    -i -v -X PUT \
    --header 'Content-Type: application/json' \
    --data '{"firstName": "Jane", "lastName": "Doe", "age": 21, "isEmployed": false}'

##1.3
curl http://localhost:8098/types/default/buckets/s16996/keys/zapytanie1-3?returnbody=true \
    -i -v -X PUT \
    --header 'Content-Type: application/json' \
    --data '{"firstName": "Mark", "lastName": "Twain", "age": 63, "isEmployed": false}'

##1.4
curl http://localhost:8098/types/default/buckets/s16996/keys/zapytanie1-4?returnbody=true \
    -i -v -X PUT \
    --header 'Content-Type: application/json' \
    --data '{"firstName": "Julius", "lastName": "Caesar", "age": 50, "isEmployed": false}'

##1.5
curl http://localhost:8098/types/default/buckets/s16996/keys/zapytanie1-5?returnbody=true \
    -i -v -X PUT \
    --header 'Content-Type: application/json' \
    --data '{"firstName": "Bob", "lastName": "Builder", "age": 42, "isEmployed": true}'

# 2. Pobierz z bazy jedną z dodanych przez Ciebie wartości.
curl -i -v http://localhost:8098/types/default/buckets/s16996/keys/zapytanie1-1

# 3. Zmodyfikuj jedną z wartości – dodając dodatkowe pole do dokumentu.
curl http://localhost:8098/types/default/buckets/s16996/keys/zapytanie1-1?returnbody=true \
    -i -v -X PUT \
    --header 'Content-Type: application/json' \
    --data '{"firstName": "John", "lastName": "Doe", "age": 24, "isEmployed": true, "jobTitle": "Scrum Master"}'

# 4. Zmodyfikuj jedną z wartości – usuwając jedno pole z wybranego dokumentu.
curl http://localhost:8098/types/default/buckets/s16996/keys/zapytanie1-1?returnbody=true \
    -i -v -X PUT \
    --header 'Content-Type: application/json' \
    --data '{"firstName": "John", "lastName": "Doe", "age": 24, "isEmployed": true}'

# 5. Zmodyfikuj jedną z wartości – zmieniając wartość jednego z pól.
curl http://localhost:8098/types/default/buckets/s16996/keys/zapytanie1-1?returnbody=true \
    -i -v -X PUT \
    --header 'Content-Type: application/json' \
    --data '{"firstName": "John", "lastName": "Doe", "age": 24, "isEmployed": false}'

# 6. Usuń jeden z dokumentów z bazy.
curl -i -v -X DELETE http://localhost:8098/types/default/buckets/s16996/keys/zapytanie1-4

# 7. Spróbuj pobrać z bazy wartość, która nie istnieje w tej bazie.
curl -i -v http://localhost:8098/types/default/buckets/s16996/keys/zapytanie1-4

# 8. Dodaj do bazy 1 dokument json (zawierający 1 pole), ale nie specyfikuj klucza.
curl http://localhost:8098/types/default/buckets/s16996/keys/?returnbody=true \
    -i -v -X POST \
    --header 'Content-Type: application/json' \
    --data '{"firstName": "Johnny"}'

# 9. Pobierz z bazy element z zadania 8.
curl -i -v http://localhost:8098/buckets/s16996/keys?keys=true
curl -i -v http://localhost:8098/types/default/buckets/s16996/keys/8MVDzK8gnkthd7EwC3fEeRSOY1L

# 10. Usuń z bazy element z zadania 8.
curl -i -v -X DELETE http://localhost:8098/types/default/buckets/s16996/keys/8MVDzK8gnkthd7EwC3fEeRSOY1L

exit 0
