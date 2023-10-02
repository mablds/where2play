import 'package:flutter/material.dart';

import '../../../../../themes/colors.dart';

class Sports extends StatelessWidget {
  const Sports({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            color: CustomColors.blue3,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/soccer.jpeg')),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Futebol de campo'),
                ),
              ],
            ),
          ),
          Container(
            color: CustomColors.blue3,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/futsal.jpeg')),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Futebol de campo'),
                ),
              ],
            ),
          ),
          Container(
            color: CustomColors.blue3,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/basketball.jpeg')),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Futebol de campo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
