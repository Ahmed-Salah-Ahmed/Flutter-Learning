import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Saxophone extends StatelessWidget {
  const Saxophone({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items.map((item) {
              return GestureDetector(
                onTap: () async {
                  AudioPlayer audioPlayer = AudioPlayer();
                  await audioPlayer.play(AssetSource(item.soundFile));
                },
                child: Container(
                  width: 50,
                  height: item.size,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.primaries[
                                item.number + 1 % Colors.primaries.length]
                            .withOpacity(0.8),
                        Colors.primaries[
                                item.number + 1 % Colors.primaries.length]
                            .withOpacity(0.8),
                        Colors.primaries[
                                item.number + 1 % Colors.primaries.length]
                            .withOpacity(0.6),
                        Colors.primaries[
                                item.number + 1 % Colors.primaries.length]
                            .withOpacity(0.6),
                      ],
                      stops: [0.0, 0.5, 0.5, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Text(
                        item.subTitle,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Text(
                        '${item.number}',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class MyListItem {
  final String title;
  final String subTitle;
  final int number;
  final double size;
  final String soundFile;

  MyListItem(
      {required this.title,
      required this.subTitle,
      required this.number,
      required this.size,
      required this.soundFile});
}

final List<MyListItem> items = [
  MyListItem(
      title: 'A',
      subTitle: 'Do',
      number: 1,
      size: 260.0,
      soundFile: 'sounds/note1.mp3'),
  MyListItem(
      title: 'B',
      subTitle: 'Ri',
      number: 2,
      size: 240.0,
      soundFile: 'sounds/note2.mp3'),
  MyListItem(
      title: 'C',
      subTitle: 'Mi',
      number: 3,
      size: 220.0,
      soundFile: 'sounds/note3.mp3'),
  MyListItem(
      title: 'D',
      subTitle: 'Fa',
      number: 4,
      size: 200.0,
      soundFile: 'sounds/note4.mp3'),
  MyListItem(
      title: 'E',
      subTitle: 'So',
      number: 5,
      size: 180.0,
      soundFile: 'sounds/note5.mp3'),
  MyListItem(
      title: 'F',
      subTitle: 'La',
      number: 6,
      size: 160.0,
      soundFile: 'sounds/note6.mp3'),
  MyListItem(
      title: 'G',
      subTitle: 'Si',
      number: 7,
      size: 140.0,
      soundFile: 'sounds/note7.mp3'),
  MyListItem(
      title: 'H',
      subTitle: 'Do',
      number: 8,
      size: 120.0,
      soundFile: 'sounds/note1.mp3'),
];
