import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management/model/all_model.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _instituteController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  XFile? image;

  Future<void> _imagePicker() async {
    ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  String? _imageUrl;
  Future<void> setImages() async {
    EasyLoading.show(status: "Uploading Image");
    var snapshot = await FirebaseStorage.instance
        .ref("Student Image")
        .child(DateTime.now().microsecondsSinceEpoch.toString())
        .putFile(File(image!.path));
    _imageUrl = await snapshot.ref.getDownloadURL();
    EasyLoading.showSuccess("Done");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      // appBar: AppBar(
      //   backgroundColor: Colors.blueGrey.shade400,
      //   centerTitle: true,
      //   title: const Text(
      //     "Sign up",
      //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 60,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 55,
                      backgroundImage:
                          image != null ? FileImage(File(image!.path)) : null,
                      child: image != null
                          ? null
                          : Icon(
                              Icons.image_outlined,
                              size: 50,
                            ),
                    ),
                    Positioned(
                      right: -20,
                      bottom: -5,
                      child: InkWell(
                          onTap: () async {
                            await _imagePicker();
                          },
                          child: const Card(
                            // color: Colors.blueGrey.shade200,
                            color: Colors.transparent,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: Colors.blueGrey,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              color: Colors.grey.shade50,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    // labelText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              color: Colors.grey.shade50,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              child: TextField(
                controller: _instituteController,
                decoration: InputDecoration(
                    //  labelText: "Enter Your Institute Name",
                    hintText: "Enter Your Institute Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              color: Colors.grey.shade50,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: "Enter Your Email Address",
                    // labelText: "Enter Your Email Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              color: Colors.grey.shade50,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                    hintText: "Enter Your Contact Number",
                    // labelText: "Enter Your Contact Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              color: Colors.blueGrey,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              child: GestureDetector(
                onTap: () async {
                  if (_nameController.text.isNotEmpty &&
                      _instituteController.text.isNotEmpty &&
                      _emailController.text.isNotEmpty &&
                      _phoneController.text.isNotEmpty &&
                      image != null) {
                    bool result =
                        await InternetConnectionChecker().hasConnection;
                    if (result == true) {
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await setImages();
                      var uniqueKeys =
                          "${_nameController.text.replaceAll(" ", "").toUpperCase()}_${_phoneController.text.substring(0, 5)}_${_emailController.text.substring(0, 4).toUpperCase()}";
                      prefs.setString("uid", uniqueKeys);
                      prefs.setString("name", _nameController.text);
                      prefs.setString("email", _emailController.text);
                      prefs.setString("institute", _instituteController.text);
                      prefs.setString("phone", _phoneController.text);
                      prefs.setString("img", _imageUrl.toString());
                      var model = SignUpModel(
                          studentName: _nameController.text,
                          studentContact: _phoneController.text,
                          email: _emailController.text,
                          instituteName: _instituteController.text,
                          uniqueKey: uniqueKeys.toLowerCase(),
                          pictureUrl: _imageUrl);

                      EasyLoading.show(status: "Updating Data");
                      await FirebaseDatabase.instance
                          .ref('Student_Account')
                          .child(uniqueKeys)
                          .set(model.toJson());
                      await EasyLoading.showSuccess("Success");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    } else {
                      EasyLoading.showError(
                          "Please, Check Internet Connection");
                    }
                  } else {
                    EasyLoading.showError("Please, Fill up all Fields");
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Create an Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
