import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter_fuck_around/main.dart';
import 'package:flutter_fuck_around/us_chat_contact.dart';
import 'package:intl/intl.dart';

class UsChat extends StatefulWidget {
  UsChat({super.key});

  @override
  State<UsChat> createState() => _UsChatState();
}

class _UsChatState extends State<UsChat> {
  int selectedIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('WeChat', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [Icon(Icons.add_circle_outline, color: Colors.grey.shade100)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: .fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromRGBO(31, 31, 31, 1),
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
          controller.jumpToPage(index);
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Wechat'),
          BottomNavigationBarItem(
            icon: Image.asset('assests/imgs/contact.png'),
            label: '通讯录',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我'),
        ],
      ),
      body: PageView(
        controller: controller,
        children: [
          Message(),
          UsChatContact(),
          Container(
            color: Colors.green,
            child: Center(child: Text('Page 2')),
          ),
          Container(
            color: Colors.blue,
            child: Center(child: Text('Page 3')),
          ),
        ],
      ),
    );
  }
}

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final List<String> avatars = <String>[
    'https://www.loremfaces.net/96/id/1.jpg',
    'https://www.loremfaces.net/96/id/1.jpg',
    'https://www.loremfaces.net/96/id/1.jpg',
    'https://www.loremfaces.net/96/id/1.jpg',
    'https://www.loremfaces.net/96/id/1.jpg',
    'https://www.loremfaces.net/96/id/1.jpg',
    'https://www.loremfaces.net/96/id/1.jpg',
  ];
  final List<String> lastMessages = <String>[
    '你昨晚的表现很好',
    '我今晚他妈喝死你',
    '我不喝酒，不抽烟，只好色而已',
    'I love kids',
    'I love nigga',
    '我操你妈个逼',
    '希望你全家被车撞',
  ];
  final List<String> names = [
    'Viet Hoes',
    '习近平',
    'Donald Trump',
    'Jeffrey Epsteiin',
    'Barack Obama',
    '邓小平',
    '毛泽东',
  ];
  final List<DateTime> lastMessageDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 4)),
    DateTime.now().subtract(Duration(days: 7)),
    DateTime.now().subtract(Duration(days: 9)),
    DateTime.now().subtract(Duration(days: 12)),
    DateTime.now().subtract(Duration(days: 12)),
    DateTime.now().subtract(Duration(days: 18000)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(25, 25, 25, 1),
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: avatars.length,
              itemBuilder: (context, index) => Messenger(
                avatar: avatars[index],
                lastMessage: lastMessages[index],
                lastMessageDate: lastMessageDates[index],
                name: names[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Messenger extends StatelessWidget {
  final String avatar;
  final String name;
  final String lastMessage;
  final DateTime lastMessageDate;
  const Messenger({
    super.key,
    required this.avatar,
    required this.lastMessage,
    required this.lastMessageDate,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            crossAxisAlignment: .start,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Image.network(avatar, width: 56, height: 56),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      lastMessage,
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                convertToDateTime(lastMessageDate),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey.shade200,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.only(left: 86),
          child: Divider(color: Colors.grey.shade400),
        ),
      ],
    );
  }
}

String convertToDateTime(DateTime lastMessageDate) {
  DateFormat dateNow = DateFormat("ss");
  String formattedNow = dateNow.format(lastMessageDate);

  DateFormat dateFormat = DateFormat("HH:mm");
  String formattedDate = dateFormat.format(lastMessageDate);

  DateFormat dateFormatOverDay = DateFormat("EEE");
  String formattedWeek = dateFormatOverDay.format(lastMessageDate);

  DateFormat dateFormatOverWeek = DateFormat("MM-dd");
  String formattedMonth = dateFormatOverWeek.format(lastMessageDate);

  if (DateTime.now().difference(lastMessageDate).inDays > 30) {
    return formattedMonth;
  } else if (DateTime.now().difference(lastMessageDate).inDays > 7) {
    return formattedWeek;
  } else if (DateTime.now().difference(lastMessageDate).inHours > 24) {
    return formattedDate;
  } else {
    return '${formattedNow}s';
  }
}
