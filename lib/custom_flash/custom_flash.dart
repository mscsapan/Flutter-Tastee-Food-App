import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class CustomFlash extends StatefulWidget {
  const CustomFlash({Key? key}) : super(key: key);

  @override
  _CustomFlashState createState() => _CustomFlashState();
}

class _CustomFlashState extends State<CustomFlash> {
  bool _isToastShown = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Flash')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () async {
                  if (_isToastShown) {
                    return;
                  }
                  _isToastShown = true;
                  await showFlash(
                      context: context,
                      duration: Duration(seconds: 1),
                      builder: (context, controller) {
                        return Flash.dialog(
                            controller: controller,
                            borderRadius: BorderRadius.circular(10),
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(bottom: 50.0),
                            backgroundColor: Colors.black26,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('Hello World!',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w400)),
                            ));
                      });
                  _isToastShown = false;
                },
                child: Text('Flash Toast')),
            ElevatedButton(onPressed: () {}, child: Text('Flash Dialog')),
            ElevatedButton(onPressed: () {}, child: Text('Flash SnackBar')),
          ],
        ),
      ),
    );
  }
}
