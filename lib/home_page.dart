import 'package:flutter/material.dart';
import 'package:whatsapp_web/app_constant.dart';
import 'package:whatsapp_web/chat_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text('Home'),
      ),
      body: MediaQuery.of(context).orientation==Orientation.portrait ? ListView.builder(
          itemCount: AppConstant.mChats.length,
          itemBuilder: (_, index){
            return ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailPage(index: index),));
              },
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(AppConstant.mChats[index]['imgUrl']),
              ),
              title: Text( AppConstant.mChats[index]['name']),
              subtitle: Text( AppConstant.mChats[index]['lastMsg']),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text( AppConstant.mChats[index]['time']),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.green,
                    child: Center(
                      child: Text( AppConstant.mChats[index]['unReadCount'].toString()),
                    ),
                  )
                ],
              ),
            );
          }) : Row(
        children: [
          Expanded(
            flex: 2,
              child: ListView.builder(
              itemCount: AppConstant.mChats.length,
              itemBuilder: (_, index){
                return ListTile(
                  onTap: (){
                    if(MediaQuery.of(context).orientation==Orientation.portrait){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailPage(index: index),));
                    } else {
                      AppConstant.selectedIndex = index;
                      setState(() {

                      });
                    }
                  },
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(AppConstant.mChats[index]['imgUrl']),
                  ),
                  title: Text( AppConstant.mChats[index]['name']),
                  subtitle: Text( AppConstant.mChats[index]['lastMsg']),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( AppConstant.mChats[index]['time']),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.green,
                        child: Center(
                          child: Text( AppConstant.mChats[index]['unReadCount'].toString()),
                        ),
                      )
                    ],
                  ),
                );
              })),
          Expanded(
              flex: 3,
              child: ChatDetailPage(index: AppConstant.selectedIndex,))
        ],
      ),
    );
  }
}
