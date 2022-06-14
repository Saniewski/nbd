# NBD - LAB04
A repository for uploading non-relational databases (NBD) class assignments at PJAIT. This readme addresses the 4th assignment.

## Installation

To install a neo4j instance, navigate to `lab04` directory and use docker-compose.yaml file with the following command:
```
docker-compose up -d --build
```

## Importing data

After succesfully creating and running the neo4j container, navigate to the `http://localhost:7474`, connect to the database (no credentials required, just hit the `connect` button), and use the provided cypher queries (`task2.cypher` and `task3.cypher`) to load the data.

Just copy the corresponding query and paste it into the neo4j query prompt.

## Running

To run a cypher command for a specific exercise, copy it from the `zapytania.cypher` file and paste into the neo4j query prompt.

## Author
[Pawel Saniewski s16996](https://github.com/Saniewski)
