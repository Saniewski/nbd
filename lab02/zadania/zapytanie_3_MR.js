printjson(db.people.mapReduce(
  function() {
    emit(this.job, 1);
  },
  function(key, values) {
    return key;
  },
  {
    out: { inline: 1 }
  }
))
