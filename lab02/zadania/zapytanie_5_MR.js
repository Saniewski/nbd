printjson(db.people.mapReduce(
  function() {
    if (this.sex == 'Female' && this.nationality == 'Poland')
      for (c of this.credit)
        emit(c.currency, parseFloat(c.balance));
  },
  function(key, values) {
    return {
      avgBalance: values.reduce((partialSum, v) => partialSum + v, 0)/values.length,
      sumBalance: values.reduce((partialSum, v) => partialSum + v, 0)
    };
  },
  {
    out: { inline: 1 }
  }
))
