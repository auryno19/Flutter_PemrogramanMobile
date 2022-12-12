import 'package:flutter/material.dart';

class genLoginSignupHeader extends StatelessWidget {
  String headerName;

  genLoginSignupHeader(this.headerName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 70.0),
          Text(
            headerName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40.0),
          ),
          SizedBox(height: 30.0),
          Image.asset(
            "assets/icons/logo.png",
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(height: 30.0),
          Text(
            headerName + ', Please !!',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 25.0),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
