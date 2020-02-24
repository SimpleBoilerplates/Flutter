import 'package:connectivity/connectivity.dart';

class InternetCheck {
  Future<bool> check() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  dynamic checkInternet(Function func) {
    check().then((intenet) {
      if (intenet != null && intenet) {
        func(true);
      } else {
        func(false);
      }
    });
  }
}
