import 'package:flutter/material.dart';
import 'package:rupeeformat/commonfunction.dart';
import 'package:flutter/services.dart';

class RupeeFormatter extends StatelessWidget {
  RupeeFormatter({
    super.key,
  });
  final myController = TextEditingController();
  final String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indian Rupee Formatter '),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            controller: myController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: 'Enter Amount',
                hintText: "₹ 0",
                border: OutlineInputBorder()),
            onChanged: (text) {
              String formattedValue = text;
              if (formattedValue[formattedValue.length - 2] == '.' &&
                  (formattedValue[formattedValue.length - 1] == "." ||
                      formattedValue[formattedValue.length - 2] == "," ||
                      formattedValue[formattedValue.length - 2] == " " ||
                      formattedValue[formattedValue.length - 2] == "-")) {
                print("contious occurance of dot or comma or sc");
                formattedValue =
                    formattedValue.substring(0, formattedValue.length - 1);
                myController.text = formattedValue;
                print(formattedValue);

                return;
              } else {
                formattedValue = text.replaceAll(',', '');
                formattedValue = formattedValue.replaceAll('₹', '');
                formattedValue = formattedValue.replaceAll(" ", '');
                formattedValue = formattedValue.replaceAll('-', '');
                print("after replace all methods ");
                print(formattedValue);
                int dotCount = '.'.allMatches(formattedValue).length;
                List<String> splitData = formattedValue.split('.');
                print(splitData);
                String beforeDot = splitData[0];
                String traillingData = '';
                String finalResult1 = '₹';
                String finalResult2 = '';
                String finalResult3 = '';
                debugPrint('handlecheck');
                debugPrint(beforeDot);
                // trailing digit 2

                if (splitData.length > 1) {
                  print("split Data rage error");
                  print(splitData);
                  print(splitData[1].isEmpty);
                  // if(splitData[1])
                  splitData[1].isNotEmpty && splitData[1].length > 2
                      ? traillingData = "." + splitData[1].substring(0, 2)
                      : traillingData = "." + splitData[1];
                  print(traillingData);
                  print("trailing Data");
                }
                // reverse
                String reversedDigits =
                    String.fromCharCodes(beforeDot.runes.toList().reversed);

                if (beforeDot.length > 3) {
                  if (beforeDot.length >= 4) {
                    finalResult2 = handleDotSep(reversedDigits.substring(3));
                    finalResult3 = reversedDigits.substring(0, 3) + ",";
                  }
                  String.fromCharCodes(finalResult3.runes.toList().reversed);
                  String finalResult = finalResult1 +
                      finalResult2 +
                      String.fromCharCodes(
                          finalResult3.runes.toList().reversed) +
                      traillingData;
                  print("11");
                  myController.text = finalResult;
                } else {
                  print("22");
                  print("trailing Data");
                  print(traillingData);
                  myController.text = finalResult1 + beforeDot + traillingData;
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
