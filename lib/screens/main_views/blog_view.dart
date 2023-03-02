import 'package:flutter/material.dart';
import 'package:postcrossing/widgets/customappbar.dart';
import 'package:screen_config/screen_config.dart';

import '../../logic/ui/mainview.dart';

final blogView = MainViewData(
  view: const BlogView(),
  icon: Icon(Icons.insert_drive_file),
);

class BlogView extends StatelessWidget {
  const BlogView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF4A4A4A),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('title'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text('asdasdasdasd')),
                      Image.network(
                        'https://s3.amazonaws.com/static2.postcrossing.com/blog/images/ne53f7iu6kzxrykbvnc7xnvitqxck3ac.jpg',
                        height: ScreenConfig.blockSizeHorizontal * 50,
                        fit: BoxFit.contain,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
