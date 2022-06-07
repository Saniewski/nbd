# NBD
A repository for uploading non-relational databases (NBD) class assignments at PJAIT.

## Installation

To install a mongodb instance, navigate to the project's root directory and use docker-compose.yaml file with the following command:
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
./run-script XX
```
where `XX` is the script's number from the script's filename that you want to run (e.g. `zapytanie_01.js`). The above command should be run from the directory of the corresponding lab.
The above script runs the following command from the context of the docker container:
```
mongosh nbd -u mangouser -p m@ng0 --authenticationDatabase=admin --quiet zapytanie_$1.js
```

## Author
[Pawel Saniewski](https://github.com/Saniewski)
