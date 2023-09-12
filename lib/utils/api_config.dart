
import 'package:http/http.dart' as http;
import 'constants.dart';

class RestApiClient {

  final login =  Uri.parse("${URL}auth/login");
  final otpCreate =  Uri.parse("${URL}auth/sent-otp");
  final verifyOtp =  Uri.parse("${URL}auth/verify-otp");
  final forgotPassword =  Uri.parse("${URL}auth/forgotPasswordChange");
  final resetPassword =  Uri.parse("${URL}auth/resetpassword");
  //Stepper Register page API
  final register =  Uri.parse("${URL}auth/register");
  //Stepper Register Update page API
  final registerUpdate =  Uri.parse("${URL}auth/registerUpdate");
  //Edit Profile page API
  final communcationEdit =  Uri.parse("${URL}user/update/religion_community");
  final communcationAddressEdit =  Uri.parse("${URL}user/update/communication_detials");
  final permenentAddressEdit =  Uri.parse("${URL}user/update/permanent_address");
  final personalEdit =  Uri.parse("${URL}user/update/personal");
  final carrierEdit =  Uri.parse("${URL}user/update/carrier_and_working_details");
  final jathagamEdit =  Uri.parse("${URL}user/update/jathagam_details");
  final familyEdit =  Uri.parse("${URL}user/update/family_details");
  final horoscopicEdit =  Uri.parse("${URL}horoscope/update-horoscope");
  //Proposal API
  final receiviedProposal =  Uri.parse("${URL}proposal/getallreceivedproposal?limit=${500000}");
  final sendProposal =  Uri.parse("${URL}proposal/getallsendproposal?limit=${500000}");
  final acceptProposal =  Uri.parse("${URL}proposal/acceptproposal");
  final rejectProposal =  Uri.parse("${URL}proposal/rejectproposal");
  final withdrawProposal =  Uri.parse("${URL}proposal/withdrawproposal");
  final sendRequestProposal =  Uri.parse("${URL}proposal/requestproposal");
  //WishList
  final getallWishlist =  Uri.parse("${URL}user/getwishlist?limit=${500000}");
  final addWishlist =  Uri.parse("${URL}user/wishlist");
  final removeWishlist =  Uri.parse("${URL}user/removewishlist");
  //Post Story page API
  final postStory = Uri.parse("${URL}auth/post-new-feed");
  final myPostStory = Uri.parse("${URL}auth/get-all-specific-newsfeed?limit=${500000}");
  final addPhoto = Uri.parse("${URL}user/addPhoto");
  final removePhoto = Uri.parse("${URL}user/removePhoto");
  final getPostStory = Uri.parse("${URL}auth/get-all-newsfeed?limit=${500000}");
  final getAllPostStory = Uri.parse("${URL}auth/get-all-saved-post?limit=${500000}");
  //Home page API
  final allUsers = Uri.parse("${URL}auth/all-user-details-features?limit=500000");
  final searchUser = Uri.parse("${URL}auth/all-user-details?limit=500000");
  final detailedPage = Uri.parse("${URL}auth/myprofile");

  //Admin Data
  final adminData = Uri.parse("${URL}category/get-all-category-with-subcategory");
  final stateData = Uri.parse("https://www.universal-tutorial.com/api/states/India");

  final detailedFilter = Uri.parse("${URL}auth/all-user-details?limit=${500000}");

  //Login with otp page API
  final loginWithOtp = Uri.parse("${URL}auth/sent-otp");
  final loginWithVerifyOtp = Uri.parse("${URL}auth/loginwithotp");

  // profile
  final changeMobile = Uri.parse("${URL}auth/mobilenumberchange");
  final changeEmail = Uri.parse("${URL}auth/emailchange");
  final accountActivate = Uri.parse("${URL}auth/activate");
  final accountAccountdeactive = Uri.parse("${URL}auth/accountdeactive");
  final contactUs = Uri.parse("${URL}contact/createcontact");
  final MakeAsProfile =  Uri.parse("${URL}user/makeAsProfilePic");
  final paymentPackage =  Uri.parse("${URL}userpackage/get-all-package");
  final createOrder =  Uri.parse("${URL}userpackage/create-order");
  final verifypayment =  Uri.parse("${URL}userpackage/payment-verification");
  final updateApp =  Uri.parse("${URL}auth/get-mobile-version");
}