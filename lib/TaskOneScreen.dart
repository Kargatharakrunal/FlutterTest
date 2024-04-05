import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/PlayerModel.dart';

class TaskOneScreen extends StatefulWidget {
  const TaskOneScreen({Key? key}) : super(key: key);

  @override
  State<TaskOneScreen> createState() => _TaskOneScreenState();
}

class _TaskOneScreenState extends State<TaskOneScreen> {
  TextEditingController enterPlayerNo = new TextEditingController();
  TextEditingController enterPlayercoins = new TextEditingController();
  List<PlayerModel> playerModelList = [];
  var reg = Random();
  var newmax;
  var newmaxplayer;
  String allPlayers = "";
  String allcoins = "";
  List<int> coinList = [];
  List<int> playerList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 1"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Enter Number of Player "),
          TextField(
            controller: enterPlayerNo,
          ),
          const Text("Enter Number of Coins "),
          TextField(
            controller: enterPlayercoins,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  playerModelList.clear();
                  int? players = int.parse(enterPlayerNo.text);
                  for (int i = 0; i < players; i++) {
                    PlayerModel playerModel = PlayerModel();
                    playerModel.playerNo = (i + 1);
                    print(playerModel.playerNo);
                    playerModel.coins = reg.nextInt(int.parse(enterPlayercoins.text));
                    print(playerModel.coins);
                    playerModelList.add(playerModel);
                  }


                  coinList.clear();
                  playerList.clear();
                  for (int i = 0; i < playerModelList.length; i++) {
                    coinList.add(playerModelList[i].coins!);
                    playerList.add(playerModelList[i].playerNo!);
                  }
                  print(coinList);
                  newmax = coinList.reduce(max);
                  newmaxplayer = coinList.indexOf(newmax) + 1;

                  for (int i = 0; i < playerList.length; i++) {
                    allPlayers = playerList.toList().toString();
                    allcoins = coinList.toList().toString();
                  }

                  setState(() {});
                },
                child: Text("Submit")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "The Maximum Number of Coins $newmax is Max No. of Player $newmaxplayer"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Maximum Players : $allPlayers \nCoins: $allcoins"),
          ),
        ],
      ),
    );
  }
}
