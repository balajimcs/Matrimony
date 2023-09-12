
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thirumanam/chat/chat_login.dart';
import 'package:thirumanam/chat/model/chat_home_page.dart';
import 'package:thirumanam/views/auth/detailed_page.dart';
import 'package:thirumanam/views/auth/login_page.dart';
import 'package:thirumanam/views/auth/login_with_create_otp.dart';
import 'package:thirumanam/views/auth/login_with_verify_otp.dart';
import 'package:thirumanam/views/auth/my_profile_page.dart';
import 'package:thirumanam/views/auth/reset_password.dart';
// import 'package:thirumanam/views/auth/sample.dart';
import 'package:thirumanam/views/auth/splash.dart';
import 'package:thirumanam/views/auth/welcome_page.dart';
import 'package:thirumanam/views/dashboard/dashboard_page.dart';
import 'package:thirumanam/views/detailed%20filter/get_connented_page.dart';
import 'package:thirumanam/views/detailed%20filter/login_upgrade.dart';
import 'package:thirumanam/views/detailed%20filter/upgrade_pro_page.dart';
import 'package:thirumanam/views/forgot%20password/Forgot_password.dart';
import 'package:thirumanam/views/forgot%20password/change_password.dart';
import 'package:thirumanam/views/forgot%20password/verify_passowrd_otp.dart';
import 'package:thirumanam/views/home/home_page.dart';
import 'package:thirumanam/views/home/pricing_pending_edit.dart';
import 'package:thirumanam/views/news%20feed/liked_by_page.dart';
import 'package:thirumanam/views/news%20feed/my_post_feed.dart';
import 'package:thirumanam/views/news%20feed/saved_post.dart';
import 'package:thirumanam/views/profile/drawer.dart';
import 'package:thirumanam/views/profile/profile_page_edit.dart';
import 'package:thirumanam/views/profile_user/account_info_page.dart';
import 'package:thirumanam/views/profile_user/basic_email_page.dart';
import 'package:thirumanam/views/profile_user/basic_info_page.dart';
import 'package:thirumanam/views/profile_user/contact_us_page.dart';
import 'package:thirumanam/views/profile_user/privacy_page.dart';
import 'package:thirumanam/views/profile_user/user_profile_page.dart';
import 'package:thirumanam/views/profile_user/user_profile_page.dart';
import 'package:thirumanam/views/proposal_page/pdf.dart';
import 'package:thirumanam/views/proposal_page/proposal_received.dart';
import 'package:thirumanam/views/proposal_page/send_proposal.dart';
// import 'package:thirumanam/views/proposal_received.dart';
import 'package:thirumanam/views/profile/profile_page.dart';
import 'package:thirumanam/views/proposal_page/wishlist_page.dart';
// import 'package:thirumanam/views/recivied_proposal.dart';
import 'package:thirumanam/views/search_page.dart';
import 'package:thirumanam/views/news%20feed/story_post.dart';
// import 'package:thirumanam/views/send_proposal.dart';

import '../views/auth/register_page.dart';
import '../views/detailed filter/detailed_filter_page.dart';
import '../views/home/admin_approval.dart';
import '../views/home/admin_payment.dart';
import '../views/home/pricing_admin.dart';
import '../widget/list.dart';

class Routes {
  //this is to prevent anyone from instantiating this object
  Routes._();

  /// routes list
  static List<GetPage<dynamic>> routes = [
    GetPage(name: RouteNames.splash, page: () => Splash()),
    GetPage(name: RouteNames.welcome, page: () => WelcomePage()),
    GetPage(name: RouteNames.register, page: () => RegisterAuth()),
    GetPage(name: RouteNames.login, page: () => LoginAuth()),
    GetPage(name: RouteNames.homePage, page: () => HomePage()),
    GetPage(name: RouteNames.dashboard, page: () => DashboradPage()),
    GetPage(name: RouteNames.forgotPassword, page: () => ForgotPassword()),
    GetPage(name: RouteNames.changePassword, page: () => ChangePassword()),
    GetPage(name: RouteNames.verifyPassowrd, page: () => VerifyPassowrdOtp()),
    GetPage(name: RouteNames.search, page: () => SearchPage()),
    GetPage(name: RouteNames.profile, page: () => ProfileEditPage()),
    GetPage(name: RouteNames.receiviedProprosal, page: () => ProposalReceived()),
    GetPage(name: RouteNames.sendProposal, page: () => SendReceived()),
    GetPage(name: RouteNames.wishList, page: () => WishListReceived()),
    GetPage(name: RouteNames.resetPassword, page: () => ResetPassword()),
    GetPage(name: RouteNames.storyPost, page: () => StroyPost()),
    GetPage(name: RouteNames.detailedFilter, page: () => DetailedFilter()),
    GetPage(name: RouteNames.loginwithotp, page: () => LoginWithCreateOtp()),
    GetPage(name: RouteNames.loginwithverifyotp, page: () => LoginWithVerifyOtp()),
    GetPage(name: RouteNames.detailedPage, page: () => DetailPage(idMatch: '',)),
    // GetPage(name: RouteNames.table, page: () => const Drawer()),
    GetPage(name: RouteNames.myDetails, page: () => MyDetailPage()),
    GetPage(name: RouteNames.myPostFeed, page: () => MyPostFeed()),
    GetPage(name: RouteNames.userProfile, page: () => MyHomePage()),
    GetPage(name: RouteNames.chat, page: () => ChatHomePage()),
    GetPage(name: RouteNames.profileScreen, page: () => ProfileScreen()),
    GetPage(name: RouteNames.basicInfo, page: () => BasicInfo()),
    GetPage(name: RouteNames.basicEmailInfo, page: () => BasicEmailInfo()),
    GetPage(name: RouteNames.privacy, page: () => PrivacyPage()),
    GetPage(name: RouteNames.contactUs, page: () => ContactUsPage()),
    GetPage(name: RouteNames.accountInfo, page: () => AccountInfoPage()),
    GetPage(name: RouteNames.savedPostFeed, page: () => SavedFeedPost()),
    GetPage(name: RouteNames.list, page: () => ListPage()),
    GetPage(name: RouteNames.upgrade, page: () => EnlargeStrategyDemo()),
    GetPage(name: RouteNames.connectedPeoples, page: () => GetConnentedPeoples()),
    GetPage(name: RouteNames.adminApproval, page: () => PendingApproval()),
    GetPage(name: RouteNames.loginAdminApproval, page: () => LoginEnlargeStrategyDemo()),
    GetPage(name: RouteNames.AdminPaument, page: () => PendingPayment()),
    GetPage(name: RouteNames.PricingAdmin, page: () => PricingAdmin()),
    GetPage(name: RouteNames.PricingPendingEdit, page: () => PricingPendingEdit()),
  ];
}

class RouteNames {
  /// Your password screen
  static const splash = '/';
  static const welcome = '/welcome_page';
  static const register = '/register_page';
  static const login = '/login_page';
  static const home = '/Home_list_page';
  static const homePage = '/home_page';
  static const dashboard = '/dashboard_page';
  static const forgotPassword = '/forgot_password';
  static const changePassword = '/change_password';
  static const verifyPassowrd = '/verify_passowrd_otp';
  static const search= '/search_page';
  static const profile= '/profile_page_edit';
  static const receiviedProprosal= '/proposal_received';
  static const sendProposal= '/send_proposal';
  static const wishList = '/wishlist_page';
  static const resetPassword = '/reset_password';
  static const storyPost = '/story_post';
  static const detailedFilter = '/detailed_filter_page';
  static const loginwithotp = '/login_with_create_otp';
  static const loginwithverifyotp = '/login_with_verify_otp';
  static const detailedPage = '/detailed_page';
  static const searchdetailedPage = '/search_detailed_filter_page';
  static const myDetails = '/my_profile_page';
  static const myPostFeed = '/my_post_feed';
  static const table = '/table';
  static const userProfile = '/drawer';
  static const chat = '/chat_home_page';
  static const profileScreen = '/user_profile_page';
  static const basicInfo = '/basic_info_page';
  static const basicEmailInfo = '/basic_email_page';
  static const privacy = '/privacy_page';
  static const contactUs = '/contact_us_page';
  static const accountInfo = '/account_info_page';
  static const savedPostFeed = '/saved_post';
  static const list = '/list';
  static const upgrade = '/upgrade_pro_page';
  static const connectedPeoples = '/get_connented_page';
  static const adminApproval = '/admin_approval';
  static const loginAdminApproval = '/login_upgrade';
  static const AdminPaument = '/admin_payment';
  static const PricingAdmin = '/pricing_admin';
  static const PricingPendingEdit = '/pricing_pending_edit';
}
