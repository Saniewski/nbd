printjson(db.people.mapReduce(
  function() {
    emit(
      this.sex,
      {
        weight: parseInt(this.weight),
        height: parseInt(this.height)
      }
    );
  },
  function(key, values) {
    return {
      avgWeight: Array.avg(values.map(e => e.weight)),
      avgHeight: Array.avg(values.map(e => e.height))
    };
  },
  {
    out: { inline: 1 }
  }
))
