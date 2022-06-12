# NBD - LAB02
A repository for uploading non-relational databases (NBD) class assignments at PJAIT. This readme addresses the 2nd assignment.

## Installation

To install a mongodb instance, navigate to `lab02` directory and use docker-compose.yaml file with the following command:
```
docker-compose up -d --build
```

## Importing data

After succesfully creating and running the mongodb container, run the following script to import the data:
```
./import-data
```

## Running

To run a script using `mongosh`, use the following command template:

```
./run-script X T
```
where `X` is the script's number from the script's filename that you want to run (e.g. `zapytanie_1.js`), and `T` is the type of the script (either `MR` - map-reduce, or `A` - aggregate).
The above script runs the following command from the context of the docker container:
```
mongosh nbd -u mangouser -p m@ng0 --authenticationDatabase=admin --quiet zapytanie_$1_$2.js
```

## Author
[Pawel Saniewski s16996](https://github.com/Saniewski)
