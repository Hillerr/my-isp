import 'package:flutter/material.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:internet_speed_test/callbacks_enum.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final internetSpeedTest = InternetSpeedTest();

  double downloadRate = 0;
  double uploadRate = 0;
  String downloadProgress = '0';
  String uploadProgress = '0';

  String unitText = 'Mb/s';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Progress $downloadProgress%'),
              Text('Download rate  $downloadRate $unitText'),
            ],
          ),
          ElevatedButton(
            child: Text('start testing'),
            onPressed: () {
              internetSpeedTest.startDownloadTesting(
                onDone: (double transferRate, SpeedUnit unit) {
                  setState(() {
                    downloadRate = transferRate;
                    unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                    downloadProgress = '100';
                  });
                },
                onProgress:
                    (double percent, double transferRate, SpeedUnit unit) {
                  setState(() {
                    downloadRate = transferRate;
                    unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                    downloadProgress = percent.toStringAsFixed(2);
                  });
                },
                onError: (String errorMessage, String speedTestError) {},
                fileSize: 20000000,
              );
              internetSpeedTest.startUploadTesting(
                onDone: (double transferRate, SpeedUnit unit) {
                  setState(() {
                    uploadRate = transferRate;
                    unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                    uploadProgress = '100';
                  });
                },
                onProgress:
                    (double percent, double transferRate, SpeedUnit unit) {
                  setState(() {
                    uploadRate = transferRate;
                    unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                    uploadProgress = percent.toStringAsFixed(2);
                  });
                },
                onError: (String errorMessage, String speedTestError) {},
                fileSize: 20000000,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Progress $uploadProgress%'),
              Text('Upload rate  $uploadRate Kb/s'),
            ],
          ),
        ],
      ),
    );
  }
}
