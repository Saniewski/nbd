printjson(db.people.mapReduce(
  function() {
    for (c of this.credit) {
      emit(
        c.currency,
        parseFloat(c.balance)
      );
    }
  },
  function(key, values) {
    result = {
      overallBalance: 0
    };

    for (v of values) {
      result.overallBalance += v;
    }

    return result;
  },
  {
    out: { inline: 1 }
  }
))
