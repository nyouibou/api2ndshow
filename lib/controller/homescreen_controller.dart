import 'dart:convert';

import 'package:api2ndshow/model/apimodelsample.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreencontroller with ChangeNotifier {
  SampleApiResponseModel? resmodel;
  fetchData() async {
    final url = Uri.parse("http://3.93.46.140/employees/");
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      // print(decodeData["count"]);

      resmodel = SampleApiResponseModel.fromJson(decodeData);
      print(resmodel?.data?.first.id);

      notifyListeners();
    } else {
      print("api failed");
    }
  }
}
