import 'dart:convert';

import 'package:api2ndshow/model/apimodelsample.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreencontroller with ChangeNotifier {
  static TextEditingController c1 = TextEditingController();
  static TextEditingController c2 = TextEditingController();
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

  deleteData(int id) async {
    final url = Uri.parse("http://3.93.46.140/employees/$id/");
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      resmodel = SampleApiResponseModel.fromJson(decodeData);

      notifyListeners();
    } else {
      print("api failed");
    }
  }

  addData() async {
    final url = Uri.parse("http://3.93.46.140/employees/create/");
    var responseAdd =
        await http.post(body: {"name": c1.text, "role": c2.text}, url);
    if (responseAdd.statusCode == 200) {
      var decodeData = jsonDecode(responseAdd.body);
      resmodel = SampleApiResponseModel.fromJson(decodeData);
      notifyListeners();
    } else {
      print("Data added successfully...");
    }
  }
}
