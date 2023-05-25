

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import '../model/all_model.dart';

class GetAllData{
  Future<List<ImageSubmitModel>>  getInformation(String uid)async{
    List<ImageSubmitModel> data = [];
    await FirebaseDatabase.instance.ref('Image_Submit').child(uid).orderByKey().get().then((value) {
      for (var d in value.children) {
        data.add(
            ImageSubmitModel.fromJson(jsonDecode(jsonEncode(d.value))),
        );
      }
    }
    );
    return data;
  }

  Future<List<SignUpModel>> getUserInfo()async{
    List<SignUpModel> data = [];
    await FirebaseDatabase.instance.ref('Student_Account').orderByKey().get().then((value) {
      for (var d in value.children) {
        data.add(
          SignUpModel.fromJson(jsonDecode(jsonEncode(d.value))),
        );
        print("${data.length}");
      }
    }
    );
    return data;
  }

}