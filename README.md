# NBD
A repository for uploading non-relational databases (NBD) class assignments at PJAIT.

## Installation

To install a mongodb instance, navigate to the project's root directory and use docker-compose.yaml file with the following command:
```
docker-compose up -d --build
```

After succesfully creating and running the mongodb container, run the following `mongoimport` command in the project's root directory:
```
mongoimport --file ./cwiczenia2.json -u mangouser -p m@ng0 --authenticationDatabase=admin --db nbd --jsonArray -c people
```

## Running

To run a script using `mongosh`, use the following command template:

```
mongosh nbd -u mangouser -p m@ng0 --authenticationDatabase=admin --quiet zapytanie_XX.js
```
where `zapytanie_XX.js` is the script's filename (replace `XX` with a script number). The above command should be run from the directory of the corresponding lab.

## Author
[Pawel Saniewski](https://github.com/Saniewski)

