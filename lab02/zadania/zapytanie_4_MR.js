printjson(db.people.mapReduce(
  function() {
    weight = parseFloat(this.weight);
    height = parseFloat(this.height);

    emit(this.nationality, weight/(height/100 * height/100));
  },
  function(key, values) {
    return {
      minBmi: Math.min(...values),
      avgBmi: values.reduce((partialSum, v) => partialSum + v, 0)/values.length,
      maxBmi: Math.max(...values)
    };
  },
  {
    out: { inline: 1 }
  }
))
