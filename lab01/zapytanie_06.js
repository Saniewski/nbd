printjson(db.people.insertOne({
  sex: 'Male',
  first_name: 'Pawel',
  last_name: 'San',
  job: 'Software Engineer',
  email: 's16996@pjwstk.edu.pl',
  location: {
    city: 'Warsaw',
    address: {
      streetname: 'Koszykowa',
      streetnumber: '86'
    }
  },
  description: 'PJATK Student Description',
  height: '192.01',
  weight: '88.88',
  birth_date: '1998-01-01T01:01:01Z',
  nationality: 'Poland',
  credit: [
    {
      type: 'visa',
      number: '12123412341234123412341234',
      currency: 'PLN',
      balance: '3.14'
    }
  ]
}))

