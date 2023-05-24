import 'package:flutter/material.dart';
import 'package:student_management/view/stdents_activity_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade400,
          centerTitle: true,
          title: Text(
            "Flutter Team",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        endDrawer: Drawer(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Card(
                color: Colors.blueGrey.shade200,
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
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 3.0),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const StudentsActivityScreen()));
                    },
                    child: Card(
                      color: Colors.blueGrey.shade300,
                      child: Center(
                          child: CircleAvatar(
                              backgroundColor: Colors.blueGrey.shade400,
                              radius: 40,
                              backgroundImage:
                                  AssetImage('images/avater.png'))),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
