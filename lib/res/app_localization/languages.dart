import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_Us': {
          'email_hint': 'Enter Email',
          'internet_exception':
              'We are unable to show results. Please check your Data Connection.',
          'general_exception':
              'We are unable to show results. Please try again.',
          'welcome_back': 'Welcome\n Back',
          'login': 'Login',
          'email_hint': 'Enter Email',
          'password_hint': 'Enter Password',
        },
        'hi_IN': {
          'email_hint': 'ईमेल दर्ज करें',
        }
      };
}
