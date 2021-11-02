class ICovidTodayByProvinces{
  String date;
  String province;
  int newCase;
  int totalCase;
  int newCaseExcludeabroad;
  int totalCaseExcludeabroad;
  int newDeath;
  int totalDeath;
  String updateDate;

  ICovidTodayByProvinces({
    this.date,
    this.province,
    this.newCase,
    this.totalCase,
    this.newCaseExcludeabroad,
    this.totalCaseExcludeabroad,
    this.newDeath,
    this.totalDeath,
    this.updateDate
  });

  factory ICovidTodayByProvinces.formJson(Map<String, dynamic> json){
    return ICovidTodayByProvinces(
      date: json["txn_date"],
      newCase: json["new_case"],
      totalCase: json["total_case:"],
      newCaseExcludeabroad: json["new_case_excludeabroad"],
      totalCaseExcludeabroad: json["total_case_excludeabroad"],
      newDeath: json["new_death"],
      totalDeath: json["total_death"],
      province: json["province:ไม่ระบุ, "],
      updateDate: json["update_date"],
    );
  }
}