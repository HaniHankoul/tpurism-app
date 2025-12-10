import 'package:flutter/material.dart';
import 'package:travel/views/home_screen.dart';

class AttractionsScreen extends StatelessWidget {
  const AttractionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(decoration: BoxDecoration(),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(color: primaryColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(spacing: 2,
                  children: [
                    InkWell(
                      onTap: () {Navigator.pop(context);},
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: Icon(
                          color: Colors.white,
                          Icons.arrow_back_outlined,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Attractions',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'bitcount',
                        fontSize: 30,
                      ),
                    ),
                    Spacer(flex: 2,)
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                return Text('data');
              },),
            )

          ],),
        ),
      ),
    );
  }
}
