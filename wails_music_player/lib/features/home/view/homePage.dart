import 'package:flutter/material.dart';

class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<myHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              elevation: 1,
              child: Container(
                padding: EdgeInsets.only(top: 23),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 10,
                child: Center(
                    child: Text(
                  'Music APP',
                  style: TextStyle(fontSize: 18),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
