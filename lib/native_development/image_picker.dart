import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// 图片选择器
///     1.使用【image_picker】
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片选择器"),
      ),
      body: MyContentBody(),
    );
  }
}

class MyContentBody extends StatefulWidget {
  @override
  _MyContentBodyState createState() => _MyContentBodyState();
}

class _MyContentBodyState extends State<MyContentBody> {
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text("点击选择图片"),
          onPressed: _pickImage,
        ),
        _imageFile == null ? Text("请选择一张图片") : Image.file(_imageFile),
      ],
    );
  }

  void _pickImage() async {
    print("点击打开相册");
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = file;
    });
  }
}
