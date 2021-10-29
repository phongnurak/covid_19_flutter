class ICovidToday{
  String date;
  int newCase;
  int totalCase;
  int newCaseExcludeabroad;
  int totalCaseExcludeabroad;
  int newDeath;
  int totalDeath;
  int newRecovered;
  int totolRecovered;
  String updateDate;

  ICovidToday({
    this.date,
    this.newCase,
    this.totalCase,
    this.newCaseExcludeabroad,
    this.totalCaseExcludeabroad,
    this.newDeath,
    this.totalDeath,
    this.newRecovered,
    this.totolRecovered,
    this.updateDate
  });

  factory ICovidToday.fromJson(Map<String, dynamic> json){
    return ICovidToday(
      date: json["txn_date"] as String,
      newCase: json["new_case"] as int,
      totalCase: json["total_case"] as int,
      newCaseExcludeabroad: json["new_case_excludeabroad"] as int,
      totalCaseExcludeabroad: json["total_case_excludeabroad"] as int,
      newDeath: json["new_death"] as int,
      totalDeath: json["total_death"] as int,
      newRecovered: json["new_recovered"] as int,
      totolRecovered: json["total_recovered"] as int,
      updateDate: json["update_date"] as String,
    );
  }

}