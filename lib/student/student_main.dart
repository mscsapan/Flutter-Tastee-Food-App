import 'package:flutter/material.dart';
import 'package:my_food_application/student/network_service.dart';
import 'package:my_food_application/student/student_model.dart';

class StudentMain extends StatefulWidget {
  @override
  _StudentMainState createState() => _StudentMainState();
}

class _StudentMainState extends State<StudentMain> {
  NetworkService service = new NetworkService();
  List<Student>? std;
  late bool loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loading = true;
    });
    service.getStudentInformation().then((value) {
      setState(() {
        std = value;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(loading ? 'Loading..' : 'Student')),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder(
              future: service.getStudentInformation(),
              builder: (context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          Student student = snapshot.data[index];
                          return ListTile(
                            onTap: () => print(student.studentName),
                            leading: CircleAvatar(
                              child: Text(student.studentId.toString()),
                            ),
                            title: Text('${snapshot.data[index].studentName}',
                                style: TextStyle(fontSize: 20)),
                            subtitle: Text(student.studentType),
                            trailing: Text(student.studentAge.toString()),
                          );
                        })
                    : Center(child: CircularProgressIndicator());
              }),
    );
  }
}
