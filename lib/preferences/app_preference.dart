// ignore_for_file: override_on_non_overriding_member


import 'package:get_storage/get_storage.dart';
import 'package:thirumanam/preferences/pref_helper.dart';


class AppPreference extends PreferenceHelper {
  var pref = GetStorage("thirumanampref");


  removePreference() {
    pref.erase();
  }

  @override
  String? get userEmail => pref.read("userEmail") ?? "";

  @override
  set userEmail(String? userEmail) {
    pref.write("userEmail", userEmail);
  }

  @override
  String? get accessToken => pref.read("accessToken") ?? "";

  @override
  set accessToken(String? accessToken) {
    pref.write("accessToken", accessToken);
  }

  @override
  String? get userId => pref.read("userId") ?? "";

  @override
  set userId(String? userId) {
    pref.write("userId", userId);
  }

  @override
  bool? get verified => pref.read("verified") ?? false;

  @override
  set verified(bool? verified) {
    pref.write("verified", verified);
  }

  @override
  String? get Email => pref.read("Email") ?? "";

  @override
  set Email(String? Email) {
    pref.write("Email", Email);
  }

  @override
  String? get attachment1 => pref.read("attachment1") ?? "";

  @override
  set attachment1(String? attachment1) {
    pref.write("attachment1", attachment1);
  }

   @override
  String? get isData => pref.read("isData") ?? "";

  @override
  set isData(String? isData) {
    pref.write("isData", isData);
  }

   @override
  int? get Order => pref.read("Order") ?? 0;

  @override
  set Order(int? Order) {
    pref.write("Order", Order);
  }

}
