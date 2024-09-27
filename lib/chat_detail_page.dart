import 'package:flutter/material.dart';

import 'app_constant.dart';

class ChatDetailPage extends StatelessWidget {
  int index;
 ChatDetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.selectedIndex>=0 ? AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(AppConstant.mChats[index]['imgUrl']),
          ),
        ),
        title: Text(AppConstant.mChats[index]['name']),
      ) : AppBar(),
    );
  }
}
