import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_food_application/student/student_model.dart';

class NetworkService {
  static final uri =
      'https://api.json-generator.com/templates/ynHi7VAzcHLJ/data?access_token=q63ss5ivxdsrpr81ifieorhe5sr60f2jnl9dxqjt';

  Future<List<Student>> getStudentInformation() async {
    http.Response response = await http.get(Uri.parse(uri));
    var jsonData = jsonDecode(response.body);
    List<Student> students = [];
    if (response.statusCode == 200) {
      for (var data in jsonData) {
        Student student = Student(
            studentId: data["studentId"],
            studentName: data["studentName"],
            studentType: data["studentType"],
            studentAge: data["studentAge"]);
        students.add(student);
      }
    }
    return students;
  }
}
