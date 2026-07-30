import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_fuck_around/us_chat.dart';
import 'package:flutter_fuck_around/main.dart';

class UsChatContact extends StatefulWidget {
  const UsChatContact({super.key});

  @override
  State<UsChatContact> createState() => _UsChatContactState();
}

class _UsChatContactState extends State<UsChatContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.pink, body: Body());
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('dev đang lọ đợi xong r làm tiếp'));
  }
}
