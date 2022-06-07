printjson(db.people.find({
  $expr: {
    $gte: [
      {
        $toDate: '$birth_date'
      },
      ISODate('2000-01-01')
    ]
  }
},
{
  _id: 0,
  first_name: 1,
  last_name: 1,
  'city': '$location.city'
}).toArray())

