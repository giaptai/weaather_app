import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsivePage(),
    );
  }
}

class ResponsivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Example'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return _buildPhoneLayout();
          } else {
            return _buildTabletLayout();
          }
        },
      ),
    );
  }

  Widget _buildPhoneLayout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'This is a phone layout',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Container(
            width: 150,
            height: 150,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'This is a tablet layout',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),
          Container(
            width: 250,
            height: 250,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}