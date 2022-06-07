printjson(db.people.aggregate([
  {
    $match:
    {
      sex: 'Female',
      nationality: 'Poland'
    }
  },
  {
    $unwind: "$credit"
  },
  {
    $group:
    {
      _id: "$credit.currency",
      avgBalance: { $avg: { $toDouble: "$credit.balance" } },
      sumBalance: { $sum: { $toDouble: "$credit.balance" } }
    }
  }
]))
