import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management/controller/get_data_on_firebase.dart';
import 'package:student_management/widget/image_seen_screen.dart';

class StudentsActivityScreen extends StatefulWidget {
  const StudentsActivityScreen(
      {Key? key,
      required this.uid,
      required this.email,
      required this.institute,
      required this.name,
        required this.img,
      required this.phn})
      : super(key: key);
  final String uid;
  final String name;
  final String email;
  final String institute;
  final String phn;
  final String img;
  @override
  State<StudentsActivityScreen> createState() => _StudentsActivityScreenState();
}

class _StudentsActivityScreenState extends State<StudentsActivityScreen> {
  String? name;
  String? email;
  String? phn;
  String? institute;
  String? img;
  String? uid;
  @override
  void initState() {
    uid = widget.uid;
    name = widget.name;
    email = widget.email;
    phn = widget.phn;
     institute = widget.institute;
    img = widget.img;
    print("\n--------Img : ${widget.img}");
    print("\n--------Img : $img");
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          // padding: EdgeInsets.zero,
          // clipBehavior: Clip.none,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: size.height * .17,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/f_t.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: -50,
                      left: 10,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: img != null
                            ? NetworkImage(img.toString())
                            : const NetworkImage(
                                "https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png"),
                      )),
                  Positioned(
                    top: (size.height * .17),
                    left: (size.width * .33),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          institute.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                        Text(
                          email.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                        Text(
                          "Phone : ${phn.toString()}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * .1,
              ),
              Card(
                color: Colors.blueGrey.shade100,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Flutter UI Design",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                  future: GetAllData().getInformation(widget.uid),
                  builder: (_, snapshots) {
                    if (snapshots.hasData) {
                      return GridView.builder(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshots.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .70,
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: Colors.grey.shade300,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ImageSeen(
                                                  imgUrl: snapshots
                                                      .data![index].pictureUrl
                                                      .toString(),
                                                )));
                                  },
                                  child: Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(snapshots
                                            .data![index].pictureUrl
                                            .toString()),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //const Text("Date: "),
                                    Text(snapshots.data![index].dateTime!
                                        .substring(0, 10)
                                        .toString()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //const Text("Time: "),
                                    Text(snapshots.data![index].dateTime!
                                        .substring(10, 19)
                                        .toString())
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
