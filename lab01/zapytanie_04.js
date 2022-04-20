printjson(db.people.aggregate(
  [
    {
      $addFields: {
        converted_weight: { $toDouble: '$weight' }
      }
    },
    {
      $match: {
        converted_weight: { $gte: 68, $lt: 71.5 }
      }
    }
  ]
).toArray())

