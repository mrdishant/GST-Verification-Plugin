import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class GstVerification {
  static const MethodChannel _channel = const MethodChannel('gst_verification');

  static Future<Map<String, dynamic>?> verifyGST(
      {required String gstNo, required String key_secret}) async {
    var url = 'https://appyflow.in/api/verifyGST?gstNo=' +
        gstNo +
        "&key_secret=" +
        key_secret;

    final response = await http.post(
      Uri.parse(url),
//      headers: {"Content-Type": "application/x-www-form-urlencoded"},
//      body: {"gstNo": gstNo, "key_secret": key_secret},
    );

    var jsonData = response.body;
    var parsedJson = json.decode(jsonData);

    return parsedJson;
  }
}
