# NBD - LAB03
A repository for uploading non-relational databases (NBD) class assignments at PJAIT. This readme addresses the 3rd assignment.

## Installation

To install a neo4j instance, navigate to `lab03` directory and use docker-compose.yaml file with the following command:
```
docker-compose up -d --build
```

## Importing data

After succesfully creating and running the neo4j container, navigate to the `http://localhost:7474`, connect to the database (no credentials required, just hit the `connect` button), and use the following cypher query to retrieve the example data:
```
:play movie-graph
```

Then, run the resulting cypher query to load the movie data into the database.

## Running

To run a cypher command for a specific exercise, copy it from the `zapytania.cypher` file and paste into the neo4j query prompt.

## Author
[Pawel Saniewski s16996](https://github.com/Saniewski)
