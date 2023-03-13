import 'package:academico_mobile/app/core/config/env/env.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebview extends WebViewController {
  CustomWebview({
    required String loadRequest,
    WebViewController? controller,
  }) : super() {
    controller = this;
    loadRequest = Env.instance['URL_LOGIN'] ?? '';
    setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  CustomWebview auth(){
    return this;
  }
  CustomWebview unauth(){
    return this;
  }
}
