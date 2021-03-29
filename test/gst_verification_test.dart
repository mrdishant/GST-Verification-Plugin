import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gst_verification/gst_verification.dart';

void main() {
  const MethodChannel channel = MethodChannel('gst_verification');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
