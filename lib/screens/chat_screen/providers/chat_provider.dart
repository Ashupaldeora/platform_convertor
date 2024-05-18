import 'package:flutter/cupertino.dart';

import '../../../utils/global provider/person_data_model.dart';

class ChatProvider extends ChangeNotifier {
  List<PersonDataModel> personData = [];

  void addData(PersonDataModel data) {
    personData.add(data);
    notifyListeners();
  }
}
