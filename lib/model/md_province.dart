class IProvince{
  String name;

  IProvince({
    this.name
  });

  factory IProvince.formJson(Map<String, dynamic> json){
    return IProvince(
      name: json["province"]
    );
  }
}