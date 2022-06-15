# - *- coding: utf- 8 - *-

"""
NBD Ćwiczenia 6 - Riak c.d.
    Na maszynie wirtualnej Riak uruchamia się automatycznie (pojedyncza instancja), dostępny jest na porcie 8098 
    Jako rozwiązanie należy przesłać kod źródłowy programu
    a także plik komunikaty.txt z przykładowymi wynikami działania programu. 
       
Napisz program, który:
a) wrzuci do bazy dokument,
b) pobierze go i wypisze,
c) zmodyfikuje go,
d) następnie pobierze i wypisze,
e) a na końcu usunie go i spróbuje pobrać z bazy.

Sam program może być napisany w jednym z następujących języków programowania: 
* Python 
* Java (wyeksportowany projekt z Eclipse, NetBeans lub IntelliJ) 
* Scala (wyeksportowany projekt z Eclipse, NetBeans, ScalaIDE lub IntelliJ)
"""

from riak import RiakClient

client = RiakClient(pb_port=8087)
bucket = client.bucket('s16996')

# a) wrzuci do bazy dokument,
new_doc = {
    'firstName': 'John',
    'lastName': 'Doe',
    'age': 24,
    'isEmployed': True
}
key = 'lab06'
bucket.new(key, data=new_doc).store()

# b) pobierze go i wypisze,
doc = bucket.get(key)
print(f'Newly created document:\n{doc.data}\n\n')

# c) zmodyfikuje go,
doc.data["isEmployed"] = False
doc.store()

# d) następnie pobierze i wypisze,
doc_modified = bucket.get(key)
print(f'Modified document:\n{doc_modified.data}\n\n')

# e) a na końcu usunie go i spróbuje pobrać z bazy
doc_modified.delete()

doc_deleted = bucket.get(key)
print(f'Deleted document:\n{doc_deleted.data}')
