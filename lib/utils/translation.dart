import 'package:get/get.dart';

class MultiLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'id': {
          'hello': 'hai saya siapa',
        },
        'en_US': {
          'hello': 'hau saya dari inggris',
        }
      };
}
