import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _instituteController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  XFile? image;

  Future<void> _imagePicker() async {
    ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade400,
        centerTitle: true,
        title: const Text(
          "Sign up",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey.shade200,
                radius: 60,
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: 55,
                  child: image != null
                      ? const Icon(Icons.account_circle)
                      : InkWell(
                          onTap: () async {
                            await _imagePicker();
                          },
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 55,
                          )),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              color: Colors.grey.shade50,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              color: Colors.grey.shade50,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _instituteController,
                decoration: InputDecoration(
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
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: "Enter Your Email Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              color: Colors.grey.shade50,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                    hintText: "Enter Your Contact Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              color: Colors.blueGrey,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
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
