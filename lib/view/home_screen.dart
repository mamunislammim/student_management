import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management/controller/get_data_on_firebase.dart';
import 'package:student_management/view/image_submit_screen.dart';
import 'package:student_management/view/stdents_activity_screen.dart';
import 'package:student_management/widget/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? uid;
  String? name;
  String? email;
  String? phn;
  String? institute;
  String? img;
  Future<void> getInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid');
    name = prefs.getString('name');
    email = prefs.getString('email');
    institute = prefs.getString('institute');
    phn = prefs.getString('phone');
    img = prefs.getString('img')!;
    print("\n\n_____________ Umg : $img");
    setState(() {});
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade400,
        centerTitle: true,
        title: const Text(
          "Flutter Team",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      endDrawer:  CustomDrawer(name: name, phn: phn, img: img, email: email,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            // InkWell(
            //   onTap: () {
            //     GetAllData().getUserInfo();
            //   },
            //   child: Text("DSFDV"),
            // ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentsActivityScreen(
                              uid: uid.toString(),
                              email: email.toString(),
                              institute: institute.toString(),
                              name: name.toString(),
                              phn: phn.toString(),
                              img: img.toString(),
                            )));
              },
              child: Card(
                color: Colors.blueGrey.shade300,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: CircleAvatar(
                              backgroundColor: Colors.blueGrey.shade400,
                              radius: 40,
                              backgroundImage:
                                  AssetImage('images/avater.png'))),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mamun Islam Mim",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "Flutter Software Developer",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: GetAllData().getUserInfo(),
                builder: (_, snapshots) {
                  if (snapshots.hasData) {
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshots.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: .95),
                      itemBuilder: (BuildContext context, int index) {
                        print(
                            "______________________${snapshots.data!.length.toString()}");
                        print("_________ Uid : $uid");
                        print(
                            "_________ Uid : ${snapshots.data![index].uniqueKey}");
                        return uid?.toLowerCase() !=
                                snapshots.data![index].uniqueKey
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              StudentsActivityScreen(
                                                uid: snapshots
                                                    .data![index].uniqueKey
                                                    .toString(),
                                                email: snapshots
                                                    .data![index].email
                                                    .toString(),
                                                institute: snapshots
                                                    .data![index].instituteName
                                                    .toString(),
                                                name: snapshots
                                                    .data![index].studentName
                                                    .toString(),
                                                phn: snapshots
                                                    .data![index].studentContact
                                                    .toString(),
                                                img: snapshots
                                                    .data![index].pictureUrl
                                                    .toString(),
                                              )));
                                },
                                child: Card(
                                  color: Colors.blueGrey.shade300,
                                  child: Column(
                                    children: [
                                      Center(
                                          child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.blueGrey.shade400,
                                              radius: 40,
                                              backgroundImage: AssetImage(
                                                  'images/avater.png'))),
                                      Card(
                                        color: Colors.blueGrey.shade400,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: snapshots.data![index]
                                                          .studentName
                                                          .toString()
                                                          .length <
                                                      10
                                                  ? Padding(
                                                      padding:
                                                      const EdgeInsets.only(top: 5,bottom: 5),
                                                child: Text(snapshots
                                                          .data![index]
                                                          .studentName
                                                          .toString()),
                                                    )
                                                  : Padding(
                                                      padding:
                                                      const EdgeInsets.only(top: 5,bottom: 5),
                                                      child: Text(snapshots
                                                          .data![index]
                                                          .studentName!
                                                          .substring(0, 12)),
                                                    ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            :    Card(
                          color: Colors.blueGrey.shade300,
                          child: Column(
                            children: [
                              Center(
                                  child: CircleAvatar(
                                      backgroundColor:
                                      Colors.blueGrey.shade400,
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                          'images/avater.png'))),
                              Card(
                                color: Colors.blueGrey.shade400,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: snapshots.data![index]
                                          .studentName
                                          .toString()
                                          .length <
                                          10
                                          ? Padding(
                                        padding:
                                        const EdgeInsets.only(top: 5,bottom: 5),
                                        child: Text(snapshots
                                            .data![index]
                                            .studentName
                                            .toString()),
                                      )
                                          : Padding(
                                        padding:
                                        const EdgeInsets.only(top: 5,bottom: 5),
                                        child: Text(snapshots
                                            .data![index]
                                            .studentName!
                                            .substring(0, 12)),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ImageSubmitScreen(
                        uniqueKey: uid.toString(),
                      )));
        },
        child: const CircleAvatar(
          backgroundColor: Colors.blueGrey,
          radius: 30,
          child: Icon(
            Icons.add,
            size: 45,
          ),
        ),
      ),
    );
  }
}
