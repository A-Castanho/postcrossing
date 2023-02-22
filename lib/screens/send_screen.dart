import 'package:flutter/material.dart';
import 'package:screen_config/screen_config.dart';

import '../widgets/customappbar.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final noTravelling = 1;

  final maxNoTravelling = 5;

  var _agreedTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      body: Column(
        children: [
          Text('Send a postcard'),
          Expanded(
            child: Column(
              children: <Widget>[
                Text('Travelling $noTravelling out of $maxNoTravelling'),
                LinearProgressIndicator(
                  value: (noTravelling.toDouble() * 1) / maxNoTravelling,
                  backgroundColor: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$noTravelling travelling'),
                    Text('${maxNoTravelling - noTravelling} left'),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('A few notes'),
                      Expanded(
                        child: ListView(
                          children: [
                            _buildInfoItem(
                                "You'll be given a Postcard ID that you must write on the postcard - the recipient will need it to register your postcard  on this website."),
                            _buildInfoItem(
                                "A copy of the adress you should mail the postcard to will be sent to your email account"),
                            _buildInfoItem(
                                "You should read the Community Guidelines before eschanging any postcards"),
                          ],
                        ),
                      ),
                      Checkbox(
                        value: false,
                        onChanged: (value) => setState(() {
                          print(value);
                          _agreedTerms = value ?? false;
                        }),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            if (_agreedTerms) {
                              /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {},
                                  )); */
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Container(
                                      width: ScreenConfig.blockSizeHorizontal,
                                      decoration: BoxDecoration(
                                          color: Colors.amber.shade100,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          border:
                                              Border.all(color: Colors.amber)),
                                      child: Text(
                                        "Please read everything",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                ),
                              );
                            }
                          },
                          icon: Icon(Icons.mail),
                          label: Text('Request adress'))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String s) {
    return ListTile(
      leading: Icon(Icons.adjust_sharp),
      title: Text(s),
    );
  }
}
