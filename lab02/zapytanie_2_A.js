printjson(db.people.aggregate([
  {
    $unwind: "$credit"
  },
  {
    $group:
    {
      _id: "$credit.currency",
      overallBalance: { $sum: { $toDouble: "$credit.balance" } }
    }
  }
]))
