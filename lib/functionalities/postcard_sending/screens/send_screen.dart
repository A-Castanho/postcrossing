import 'package:flutter/material.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});
  final noTravelling = 0;
  final maxNoTravelling = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Send a postcard'),
          Column(
            children: <Widget>[
              Text('Travelling $noTravelling out of $maxNoTravelling'),
              LinearProgressIndicator(),
              Row(
                children: [
                  Text('$noTravelling travelling'),
                  Text('${maxNoTravelling - noTravelling} left'),
                ],
              ),
              Column(
                children: [
                  Text('A few notes'),
                  Column(
                    children: [
                      Text(
                          "You'll be given a postcard id that you must write on the postcard - the recipient will need it to register your postcard  on this website."),
                      Text(
                          "You'll be given a postcard id that you must write on the postcard - the recipient will need it to register your postcard  on this website."),
                      Text(
                          "You'll be given a postcard id that you must write on the postcard - the recipient will need it to register your postcard  on this website."),
                    ],
                  ),
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.mail),
                      label: Text('Request adress'))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
