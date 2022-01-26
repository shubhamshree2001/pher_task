import 'package:flutter/material.dart';
import 'package:task/screens/result.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FocusNode nodeOne = FocusNode();

  FocusNode nodeTwo = FocusNode();

  FocusNode nodeThree = FocusNode();

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    nodeOne.dispose();
    nodeTwo.dispose();
    nodeThree.dispose();

    super.dispose();
  }

  ontap() {
    if (_controller1.text == '' ||
        _controller2.text == '' ||
        _controller3.text == '') {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Error"),
          content: const Text("You have leaved a field empty"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("okay"),
            ),
          ],
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Result(
                catererAmount: double.parse(_controller1.text),
                decoratoramount: double.parse(_controller2.text),
                photographerAmount: double.parse(_controller3.text))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Viewer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textfield(
              nodeOne,
              "Caterer Amount",
              "Enter Decorator Amount",
              _controller1,
            ),
            textfield(
              nodeTwo,
              "Designer Amount",
              "Enter Carpenter Amount",
              _controller2,
            ),
            textfield(
              nodeThree,
              "Photographer Amount",
              "Enter Designer Amount",
              _controller3,
            ),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget textfield(FocusNode fn, String hintext, String labeltext,
      TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextField(
        controller: controller,
        autofocus: true,
        focusNode: fn,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: labeltext,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: ontap,
      child: const Text("Show Result"),
    );
  }
}
