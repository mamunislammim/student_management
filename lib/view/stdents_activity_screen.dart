import 'package:flutter/material.dart';
import 'package:student_management/widget/image_seen_screen.dart';

class StudentsActivityScreen extends StatefulWidget {
  const StudentsActivityScreen({Key? key}) : super(key: key);

  @override
  State<StudentsActivityScreen> createState() => _StudentsActivityScreenState();
}

class _StudentsActivityScreenState extends State<StudentsActivityScreen> {
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
                  const Positioned(
                      bottom: -50,
                      left: 10,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://scontent.fdac20-1.fna.fbcdn.net/v/t39.30808-6/331153809_723316119531111_3314194278158821126_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeF31UgJSGlRs-PuqA3hJY279NJsU9sIpUv00mxT2wilSzlVOaZWJkDoUCONbr-C0E3BzEQlLFIEl66X3nCKIPWZ&_nc_ohc=45rQzsJsYYcAX9QfZtp&_nc_ht=scontent.fdac20-1.fna&oh=00_AfDSQDhH8D_f_MqoLHJRDwlAtvBrNxkbsVcMHvyFsJCHrA&oe=6473372E"),
                      )),
                  Positioned(
                      top: (size.height * .17),
                      left: (size.width * .33),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mamun Islam Mim",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Flutter Software Developer",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          // Text(
                          //   "Mamun Islam Mim",
                          //   style: TextStyle(
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 20),
                          // ),
                        ],
                      ))
                ],
              ),
              SizedBox(
                height: size.height * .1,
              ),
              Card(
                color: Colors.blueGrey.shade100,
                child: Row(
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
              GridView.builder(
                padding: const EdgeInsets.only(left: 5, right: 5),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .77,
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
                                    builder: (context) =>
                                        const ImageSeen()));
                          },
                          child: Container(
                            height: 120,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJNZW4BLBsUQy32kokD21__zw0E1b6e3S8vHkQstNqnziy4kv-CXN2PG4NkLOERIye90M&usqp=CAU'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text("2023-05-24")
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
