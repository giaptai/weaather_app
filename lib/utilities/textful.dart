import 'package:flutter/material.dart';
import 'package:weaather_app/utilities/colofull.dart';

class Textfull {
  static Widget textCountry(String? name) {
    return Text(
      name!,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colorfull.lightBlue,
      ),
    );
  }

  static Widget textCity(String? name) {
    return Text(
      '$name',
      style: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Colorfull.lightBlue,
      ),
    );
  }

  static Widget textDregees(String name) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 74.0,
        fontWeight: FontWeight.bold,
        color: Colorfull.lightBlue,
      ),
    );
  }

  static Widget textStatus(String name) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Colorfull.lightBlue,
      ),
    );
  }

  static Widget textStatus2(String name1, String name2, bool wtf) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          wtf == true
              ? const Icon(Icons.air_rounded, size: 32)
              : const Icon(Icons.opacity_rounded, size: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name1,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                name2,
                style: const TextStyle(fontSize: 13.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
