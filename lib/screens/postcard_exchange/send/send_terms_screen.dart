import 'package:flutter/material.dart';
import 'package:screen_config/screen_config.dart';

import '../../../content/styles.dart';
import '../../../widgets/customappbar.dart';
import 'send_screen.dart';

class SendTermsScreen extends StatefulWidget {
  static const name = 'send_terms_screen';

  const SendTermsScreen({super.key});

  @override
  State<SendTermsScreen> createState() => _SendTermsScreenState();
}

class _SendTermsScreenState extends State<SendTermsScreen> {
  final TextStyle _noteStyle = const TextStyle(color: Colors.black);

  final noTravelling = 1;

  final maxNoTravelling = 5;

  var _agreedTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Send a postcard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Send a postcard'),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Travelling $noTravelling out of $maxNoTravelling'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        LinearProgressIndicator(
                          //TODO Change to true color
                          color: Colors.blue,
                          value:
                              (noTravelling.toDouble() * 1) / maxNoTravelling,
                          minHeight: 15,
                          backgroundColor: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('$noTravelling travelling'),
                            Text('${maxNoTravelling - noTravelling} left'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('A few notes - please read carefully:'),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenConfig.blockSizeVertical * 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildInfoItem(
                                  RichText(
                                    text: TextSpan(
                                      text: "You'll be given a ",
                                      style: _noteStyle,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Postcard ID ',
                                            style: referenceStyle),
                                        const TextSpan(
                                            text:
                                                'that you must write on the postcard - the recipient will need it to register your postcard  on this website.'),
                                      ],
                                    ),
                                  ),
                                ),
                                _buildInfoItem(const Text(
                                    "A copy of the adress you should mail the postcard to will be sent to your email account")),
                                _buildInfoItem(const Text(
                                    "You should read the Community Guidelines before eschanging any postcards")),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _agreedTerms,
                              onChanged: (value) => setState(() {
                                _agreedTerms = value ?? false;
                              }),
                            ),
                            const Expanded(
                              child: Text(
                                "I've read the notes above and want to receive an address to where I'll send a postcard.",
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              if (_agreedTerms) {
                                Navigator.pushReplacementNamed(
                                    context, SendScreen.name);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Container(
                                        width: ScreenConfig.blockSizeHorizontal,
                                        decoration: BoxDecoration(
                                            color: Colors.amber.shade100,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(12)),
                                            border: Border.all(
                                                color: Colors.amber)),
                                        child: const Text(
                                          "Please read everything",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.mail),
                            label: const Text('Request adress'))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(Widget title) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.adjust_sharp),
        minLeadingWidth: 1,
        title: title);
  }
}
