# NBD - LAB06
A repository for uploading non-relational databases (NBD) class assignments at PJAIT. This readme addresses the 6th assignment.

## Installation

To install a riak-kv instance, navigate to `lab06` directory and use docker-compose.yaml file with the following command:
```
docker-compose up -d --build
```

After succesfully creating and running the riak-kv container, create a python virtual environment using the following command:
```
python -m venv venv
```

Note, that in the above command, you should substitute `python` with the python command you have installed on your system (might be `python3`, `python3.9`, etc.).

Then, switch to the virtual environment's context in your shell console. On Linux and MacOS, run:
```
source ./venv/bin/activate
```

On Windows:
```
& ./venv/Scripts/Activate.ps1
```

When you switched to the virtual environment, install the dependencies with the command:
```
pip install -r ./requirements.txt
```

One last thing is to locate the file `venv/lib/python3.9/site-packages/riak/codecs/__init__.py` and edit the following line:
```
Msg = collections.namedtuple('Msg',
                             ['msg_code', 'data', 'resp_code'],
                             verbose=False)
```

Delete the `verbose=False` argument so that it looks like this:
```
Msg = collections.namedtuple('Msg',
                             ['msg_code', 'data', 'resp_code'])
```

And now you're good to go!

## Importing data

This assignment does not require importing any example data.

## Running

Just run the `main.py` and check the output!

## Author
[Pawel Saniewski s16996](https://github.com/Saniewski)
