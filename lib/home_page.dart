import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_task/models/jokes_model.dart';
import 'package:flutter_app_task/services/joke_service.dart';
import 'package:flutter_app_task/widget/loaders.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RandomJokeModel randomJokes = RandomJokeModel();
  JokeServices jokeServices = JokeServices();
  bool tap = false;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    jokeServices.fetchRandomJoke().then((value) {
      setState(() {
        loading = !loading;
        randomJokes = value;
      });
    });
  }

  void tapSetup() {
    setState(() {
      tap = true;
    });
    refreshJokes();
  }

  void refreshJokes() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        loading = !loading;
        tap = false;
      });

      init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Make me laugh'),
        ),
        body: Center(
            child: (() {
          if (loading) {
            return const LoadingScreen();
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(children: [
                  InkWell(
                    child: Text(
                      randomJokes.jokeSetup!,
                      style: const TextStyle(fontSize: 18),
                    ),
                    onTap: () => tapSetup(),
                  ),
                  const SizedBox(height: 50),
                  tap
                      ? Text(
                          randomJokes.jokePunchline!,
                          style: const TextStyle(fontSize: 16),
                        )
                      : const SizedBox()
                ]),
              ),
            );
          }
        }())));
  }
}
