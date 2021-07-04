import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Approver App',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
              SizedBox(
                height: 150.0,
              ),
              Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('assets/images/splash.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'A process might have lots of components to approve from proper authority, this app made it easy in the fingertip...',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              )
            ],
          )),
    );
  }
}
