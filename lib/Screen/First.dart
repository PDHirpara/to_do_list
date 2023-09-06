import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/Data.dart';

import '../Global.Dart.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('second');
              },
              icon: Icon(
                Icons.data_thresholding,
                color: Colors.white,
              ),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
          iconSize: 35,
        ),
        backgroundColor: Colors.purple,
        title: const Text(
          "To Do List",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Center(
              child: Text(
                "Set Time For Your Work!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton(
                hint: Text(
                  (Global.h == null) ? "Hour" : "${Global.h}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                items: hour
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(
                    () {
                      Global.h = val as String?;
                    },
                  );
                },
              ),
              DropdownButton(
                hint: Text(
                  (Global.m == null) ? "Minute" : "${Global.m}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                items: minute
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(
                    () {
                      Global.m = val as String?;
                    },
                  );
                },
              ),
              DropdownButton(
                hint: Text(
                  (Global.ampm == null) ? "AM/PM" : "${Global.ampm}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                items: ap
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(
                    () {
                      Global.ampm = val as String?;
                    },
                  );
                },
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Center(
              child: Text(
                "Enter Task!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: taskController,
              onChanged: (val) {
                setState(() {
                  Global.task = val;
                });
              },
              decoration: const InputDecoration(
                hintText: "Enter Your Today's Task",
                label: Text("Enter Task"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed("second");
                Global.n_m = DateTime.now().minute;
                Global.n_h = DateTime.now().hour;
              });
            },
            child: Text(
              "GO",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
