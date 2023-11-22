import 'package:flutter/material.dart';
import 'package:management_app/Model/student_model.dart';
import 'package:management_app/Widget/circle_container.dart';
import 'package:management_app/utils/string_utils.dart';

class StudentDetailsScreen extends StatelessWidget {
  StudentModel studentModel;

  StudentDetailsScreen({Key? key, required this.studentModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringUtils.memberDetails,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                StringUtils.memberDetails,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height / 6.5,
                width: MediaQuery.of(context).size.height / 6.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/man.png',
                    width: 80,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Name : ${studentModel.studentName!}',
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              Text(
                "Dept : ${studentModel.studentDept!}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              Text(
                "Batch :  ${studentModel.studentBatch!}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              Text(
                "Number : ${studentModel.studentNumber!}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const SizedBox(height: 40),

              // icons
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    CircleContainer(
                      height: 50,
                      width: 50,
                      child: const Icon(Icons.phone,size: 30,color: Colors.white,),
                    ),
                    CircleContainer(
                      height: 50,
                      width: 50,
                      child: const Icon(Icons.email,size: 30,color: Colors.white,),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}