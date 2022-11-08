
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:email_cirest/views/pages/pages.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Uri? _initialUri;
  Uri? _latestUri;
  Object? _err;
  StreamSubscription? _sub;
  final _scaffoldKey = GlobalKey();
  bool _initialUriIsHandled = false;

  Future<void> _handleInitialUri() async {
    if (!_initialUriIsHandled){
      _initialUriIsHandled = true;
      try{
        final uri = await getInitialUri();
        if (uri == null) {
          print("No uri detected!");
        } else {
          print("Uri detected !");
        }

        if(!mounted) return;
        setState(() {
          _initialUri = uri;
        });
      } on PlatformException {
        print("Failed to get uri!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_initialUri == null){
      _handleInitialUri();
      return const Sendmail();
    } else {
      return const Emailverif();
    }
  }
}
