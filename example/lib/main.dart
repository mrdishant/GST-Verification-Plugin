import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gst_verification/gst_verification.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  String gstNo, key_secret, response = '';

  double valueOp = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('GST Verification example app'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    maxLines: 1,
                    onChanged: (value) {
                      gstNo = value;
                    },
                    decoration: InputDecoration(
                      labelText: "GST Number *",
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    maxLines: 1,
                    onChanged: (value) {
                      key_secret = value;
                    },
                    decoration: InputDecoration(
                      labelText: "key_secret *",
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(response),
                  Opacity(
                    opacity: valueOp,
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: verifyGSTNumber,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Verify GST',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void verifyGSTNumber() {
    print(gstNo + " , " + key_secret);

    valueOp = 1;
    setState(() {});

    GstVerification.verifyGST(gstNo, key_secret).then((result) {
      JsonEncoder encoder = new JsonEncoder.withIndent('  ');
      String prettyprint = encoder.convert(result);

      print(prettyprint);

      response = "JSON Response:\n\n" + prettyprint;
      print(response);
      valueOp = 0;
      setState(() {});
    }).catchError((error) {
      print(error);
      valueOp = 0;
      setState(() {});
    });
  }
}
