# gst_verification

A new Flutter plugin to verify GST Number in your Flutter Apps.

## Getting Started

This plugin is used to get details of any gst Number. This plugin needs a key_secret provided by [AppyFlow Technologies](https://appyflow.in/verify-gst/)
Visit the following url to get your own key_secret
[Get Key Secret](https://appyflow.in/verify-gst/#getAPI)

## Screenshots

![WhatsApp Image 2019-08-13 at 1 27 19 PM(1)](https://user-images.githubusercontent.com/25786428/62924708-4af51880-bdce-11e9-8e69-7a7dd003e952.jpeg)

![WhatsApp Image 2019-08-13 at 1 27 19 PM](https://user-images.githubusercontent.com/25786428/62924706-49c3eb80-bdce-11e9-9331-80cb56e70d53.jpeg)



### Register to get your own key_secret


## Usage
```
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

```

Result will be in JSON Format. Then you can use it to get Details about the gstNumber. For More you can read documentation online
[Documentation](https://appyflow.in/verify-gst/#docs)

For any query :
Mail me at mr.dishantmahajan@gmail.com