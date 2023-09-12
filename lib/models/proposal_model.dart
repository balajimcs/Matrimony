class ProposalDataModel{
  List<ProposalProfileModel>? itemList;

  ProposalDataModel({this.itemList});
}

class ProposalProfileModel {
  String? id;
  String? name;
  String? gender;
  String? image;
  int? age;

  ProposalProfileModel({ this.id, this.gender, this.name, this.image = "", this.age});
}