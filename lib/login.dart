import 'package:college/dashboard.dart';
import 'package:college/models/loginmodel.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 255, 255, 255),
              Colors.orange.shade500
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  border: null,
                  labelText: 'Enter your USN',
                  fillColor: Colors.white,
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                // Assuming userList is a list of LoginModel
                if (userList.any((user) => user.usn == myController.text)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DashBoard()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text("Incorrect USN!"),
                      );
                    },
                  );
                }
              },
              tooltip: 'Show me the value!',
              child: const Icon(Icons.done),
            ),
          ],
        ),
      ),
    );
  }
}
