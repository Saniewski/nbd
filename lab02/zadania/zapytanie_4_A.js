printjson(db.people.aggregate([
  {
    $addFields: {
      bmi:
      {
        $divide: [
          { $toDouble: "$weight" },
          {
            $multiply: [
              {
                $divide: [
                  { $toDouble: "$height" },
                  100
                ]
              },
              {
                $divide: [
                  { $toDouble: "$height" },
                  100
                ]
              }
            ]
          }
        ]
      }
    }
  },
  {
    $group:
    {
      _id: "$nationality",
      minBmi: { $min: "$bmi" },
      avgBmi: { $avg: "$bmi" },
      maxBmi: { $max: "$bmi" }
    }
  }
]).toArray())
