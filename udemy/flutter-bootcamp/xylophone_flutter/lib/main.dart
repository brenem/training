import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  Future<void> playSound(int position) {
    final player = AudioPlayer();
    return player.play(AssetSource('note$position.wav'));
  }

  Expanded buildKey({required Color color, required int keyPosition}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const BeveledRectangleBorder(),
        ),
        onPressed: () async {
          await playSound(keyPosition);
        },
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              buildKey(color: Colors.red, keyPosition: 1),
              buildKey(color: Colors.orange, keyPosition: 2),
              buildKey(color: Colors.yellow, keyPosition: 3),
              buildKey(color: Colors.green, keyPosition: 4),
              buildKey(color: Colors.teal, keyPosition: 5),
              buildKey(color: Colors.blue, keyPosition: 6),
              buildKey(color: Colors.purple, keyPosition: 7),
            ],
          ),
        ),
      ),
    );
  }
}
