import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyAppTitleText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<MyModel>(context).message);
  }
}

class MyAppTitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<MyModel>(context, listen: false).message); // Only show at start
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        Provider.of<MyModel>(context).setMessage(newText);
      },
    );
  }
}

class MyModel extends ChangeNotifier {
  String message = 'Top Secret Data';
  void setMessage(String newText) {
    message = newText;
    notifyListeners();
  }
}
