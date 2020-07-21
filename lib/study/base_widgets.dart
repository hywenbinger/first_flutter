import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text、Button、Image、TextField"),
      ),
      body: MyStatefulContentBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.adb),
        onPressed: () => print("OutlineButton click"),
      ),
    );
  }
}

class MyStatefulContentBody extends StatefulWidget {
  @override
  _MyStatefulContentBodyState createState() {
    return _MyStatefulContentBodyState();
  }
}

class _MyStatefulContentBodyState extends State<MyStatefulContentBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        /// Column在交叉轴上(即横轴上)，组件默认是居中的
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText(),
          MyRichText(),
          MyButtons(),
          MyImage(),
          MyTextField(),
        ],
      ),
    );
  }
}

/// TextField
class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
//  var _userName = "";
//  var _password = "";

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: _userNameController,
          decoration: InputDecoration(
            labelText: "username",
            hintText: "Please input username",
            icon: Icon(Icons.person),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
//            print("username: $value");
//            _userName = value;
          },
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: "password",
            hintText: "Please input password",
            icon: Icon(Icons.security),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
//            print("password: $value");
//            _password = value;
          },
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 50,
          child: RaisedButton(
            child: Text(
              "登录",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            color: Colors.blue,
            onPressed: () {
//              print("userName = $_userName, password = $_password");
              print(
                  "userName = ${_userNameController.text}, password = ${_passwordController.text}");
            },
          ),
        )
      ],
    );
  }
}

/// Image
class MyImage extends StatelessWidget {
  const MyImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    return Image(
//      width: 350,
//      height: 150,
//      ///通过混入模式 [colorBlendMode] 把 [color] 混入到图片中
//      color: Colors.grey,
//      colorBlendMode: BlendMode.overlay,
//      alignment: Alignment.bottomLeft,
//      repeat: ImageRepeat.repeat,
//      image: NetworkImage(
//          "https://i0.hdslb.com/bfs/archive/e62b6b095ef38dfb742687f11e4b570dde420b5d.png"),
//    );

//    return Image.network("https://i0.hdslb.com/bfs/archive/e62b6b095ef38dfb742687f11e4b570dde420b5d.png");

    /// 1.创建文件夹存放图片
    /// 2.在pubspec.yaml中进行配置
    /// 3.使用图片
//    return Image(
//      image: AssetImage("assets/images/image.jpg"),
//      width: 100,
//      height: 100,
//    );

//    return Image.asset(
//      "assets/images/image.jpg",
//      width: 150,
//      height: 150,
//    );

    /// Flutter默认是有内存缓存的
    /// 1000张 100M
    return FadeInImage(
      width: 100,
      height: 100,
//      fadeInDuration: Duration(milliseconds: 4000),
//      fadeOutDuration: Duration(milliseconds: 5000),
      placeholder: AssetImage("assets/images/image.jpg"),
      //可以设置占位图
      image: NetworkImage(
          "https://i0.hdslb.com/bfs/archive/e62b6b095ef38dfb742687f11e4b570dde420b5d.png"),
    );
  }
}

/// Button
class MyButtons extends StatelessWidget {
  const MyButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 1.RaisedButton
        RaisedButton(
          child: Text("RaisedButton"),
          onPressed: () => print("RaisedButton click"),
        ),
        // 2.FlatButton
        FlatButton(
          child: Text("FlatButton"),
          color: Colors.pink,
          onPressed: () => print("FlatButton click"),
        ),
        ButtonTheme(
          minWidth: 20,
          height: 2,
          child: FlatButton(
            /// 可以看到，不设置内容，但Button还是有默认宽高，
            /// 这是使用了ButtonTheme导致的
            /// 使用ButtonTheme可以修改宽高
            child: Text("FlatButton"),
            padding: EdgeInsets.all(0),
            //设置内边距都是0
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Colors.blue,
            onPressed: () => print("FlatButton click"),
          ),
        ),
        // 3.OutlineButton
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: () => print("OutlineButton click"),
        ),
        // 4.FloatingActionButton
        // 5.自定义Button
        FlatButton(
          onPressed: () => print("MyButton click"),
          color: Colors.black12,
          /// 默认情况下Button上下有间距，默认占据宽高是48*48，设置下面参数后就没了
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, //默认这个值是max
            children: <Widget>[
              Icon(
                Icons.add_a_photo,
                color: Colors.blue,
              ),
//              SizedBox(
//                width: 10,
//                height: 60,
//              ),
              Text(
                "Camera",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pinkAccent,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

/// RichText
class MyRichText extends StatelessWidget {
  const MyRichText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: "Hello Java Hello Java",
        style: TextStyle(fontSize: 20, color: Colors.red),
      ),
      WidgetSpan(
          child: Icon(
            Icons.school,
            color: Colors.cyanAccent,
          )),
      TextSpan(
        text: "Hello Kotlin Hello Kotlin",
        style: TextStyle(fontSize: 22, color: Colors.green),
      ),
      WidgetSpan(
          child: Icon(
            Icons.home,
            color: Colors.amberAccent,
          )),
      TextSpan(
        text: "Hello Flutter Hello Flutter",
        style: TextStyle(fontSize: 24, color: Colors.blue),
      ),
    ]));
  }
}

/// Text
class MyText extends StatelessWidget {
  const MyText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "普通文本，普通文本，普通文本，普通文本，普通文本",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
