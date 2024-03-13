import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(page0());

class page0 extends StatelessWidget {
  const page0({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Center(
              child: Text(
                "Are You Ready?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: page1(),
            ),
          )),
    );
  }
}

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  List<Widget> scorekeeper = [];

  Quiz_brain quiz = Quiz_brain();

  void checkanswer(bool ans) {
    setState(() {
      if (quiz.isfinished() == true) {
        Alert(
                context: context,
                type: AlertType.error,
                title: "Quiz Finished!",
                desc: "Starting the Quiz Again")
            .show();

        quiz.reset();

        scorekeeper = [];
      }
      if (quiz.getans() == ans) {
        scorekeeper.add(
          Icon(
            (Icons.check),
            color: Colors.green,
          ),
        );
      } else {
        if (true) {
          scorekeeper.add(
            Icon(
              (Icons.close),
              color: Colors.red,
            ),
          );
        }
      }
      quiz.next();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quiz.getQue(),
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                checkanswer(true);
              },
              child: Card(
                color: Colors.green,
                child: ListTile(
                  title: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "TRUE",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextButton(
              onPressed: () {
                checkanswer(false);
              },
              child: Card(
                color: Colors.red,
                child: ListTile(
                  title: Center(
                      child: Text(
                    "FALSE",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
                ),
              )),
        )),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}
