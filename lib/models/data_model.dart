class HomePageDataModel{
  String? title;
  List<HomeProfileModel>? itemList;

  HomePageDataModel({this.title, this.itemList});
}

class HomeProfileModel {
  String? id;
  String? userId;
  String? name;
  String? gender;
  String? image;
  String? designation;
  String? location;
  String? cusId;
  int? heightInch;
  String? sendProposalId;
  String? receiveProposalId;
  String? removeWishlistId;
  int? isRequestSent;
  int? isRequestSentAccept;
  int? isRequestSentReject;
  int? isRequestReceived;
  int? isRequestReceivedAccept;
  int? isRequestReceivedReject;
  int? isaddedWishlist;
  bool? sendProposal;
  bool? sendacceptProposal;
  bool? sendrejectProposal;
  bool? receiveProposal;
  bool? receiveacceptProposal;
  bool? receiverejectProposal;
  String? proposalId;
  int? age;
  bool? isLiked;
  HomeProfileModel({this.id, this.userId,this.gender, this.name, this.image = "", this.designation = "", this.age, this.isLiked = false,
  this.location, this.cusId, this.heightInch, this.sendProposal, this.receiveacceptProposal, this.receiveProposal, this.receiverejectProposal, this.proposalId, this.sendProposalId,
  this.receiveProposalId, this.removeWishlistId, this.isRequestSent, this.isRequestSentAccept, this.isRequestSentReject,
  this.isRequestReceived, this.isRequestReceivedAccept, this.isRequestReceivedReject, this.isaddedWishlist, this.sendacceptProposal, this.sendrejectProposal});

  HomeProfileModel.clone(HomeProfileModel source)
      : id = source.id,
        userId = source.userId,
        name = source.name,
  gender = source.gender,
  image = source.image,
        designation = source.designation,
  location = source.location,
  cusId = source.cusId,
        heightInch = source.heightInch,
  age = source.age,
  sendProposalId = source.sendProposalId,
  receiveProposalId = source.receiveProposalId,
  removeWishlistId = source.removeWishlistId,
  isLiked = source.isLiked,
        sendProposal = source.sendProposal,
        sendacceptProposal = source.sendacceptProposal,
        sendrejectProposal = source.sendrejectProposal,
        receiveProposal = source.receiveProposal,
        receiveacceptProposal = source.receiveacceptProposal,
        receiverejectProposal = source.receiverejectProposal,
        proposalId = source.proposalId;

}

class FilterData{
  String? category;
  int? catId;
  bool? isCatSel;
  List<FilterOptions>? filterOptions;
  FilterData({this.category, this.catId, this.isCatSel, this.filterOptions});
}

class FilterOptions{
  String? options;
  int? optionId;
  bool? isSelected;
  FilterOptions({this.options, this.optionId, this.isSelected});
}

class StateModel{
  String? name;
  String? code;
  bool? isSelected;
  StateModel({this.code, this.isSelected, this.name});
}