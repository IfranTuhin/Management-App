import 'package:flutter/material.dart';
import 'package:management_app/Model/grid_view_model.dart';

class HomeScreen extends StatelessWidget {

  // Grid view data
  final List _dataList = [
    Data(image: "assets/images/coaching.png", text: "Member of PADMA"),
    Data(image: "assets/images/group.png", text: "PADMA Panel"),
    Data(image: "assets/images/help.png", text: "PADMA Info"),
    Data(image: "assets/images/education.png", text: "Coaching Panel"),
    Data(image: "assets/images/gallery.png", text: "PADMA Gallery"),
    Data(image: "assets/images/alarm.png", text: "PADMA Notices"),
    Data(image: "assets/images/university.png", text: "Getway"),
    Data(image: "assets/images/presentation.png", text: "Training Center"),
  ];

   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Management",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: GridView.builder(
          itemCount: _dataList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage(_dataList[index].image),
                      ),
                    ),
                  ),
                  const SizedBox(height: 13,),
                  Text(_dataList[index].text,style: const TextStyle(fontSize: 20,),),
                ],
              )
            );
          },
        ),
      ),
    );
  }
}
