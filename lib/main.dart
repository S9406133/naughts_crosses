import 'package:flutter/material.dart';

// Win number counts
int xCount = 0, oCount = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Naughts & Crosses',
      home: NaughtsCrosses(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NaughtsCrosses extends StatefulWidget {
  const NaughtsCrosses({Key? key}) : super(key: key);

  @override
  State<NaughtsCrosses> createState() => _NaughtsCrossesState();
}

class _NaughtsCrossesState extends State<NaughtsCrosses> {

  // Current entry (X,O)
  String current = '';
  // Entry in each tile
  List<String> tiles = ['', '', '', '', '', '', '', '', ''];
  // Count of turns
  int turnNum = 0;
  // Win flag
  bool won = false;

  @override
  void initState() {
    current = '';
    tiles = ['', '', '', '', '', '', '', '', ''];
    turnNum = 0;
    won = false;
    super.initState();
  }

  // Sets tile attributes when tapped
  void tap (int tileNum) {
    if (current.isEmpty || current == 'O') {
      tiles[tileNum] = 'X';
    } else {
      tiles[tileNum] = 'O';
    }

    current = tiles[tileNum];
    turnNum++;
  }

  // Determines if anyone has won
  void hasWon (String data){

    // Across
    for(int i=0; i<=6; i+=3){
      if ((tiles[i] == data) && (tiles[i+1] == data) && (tiles[i+2] == data)){
        won = true;
        break;
      }
    }

    // Down
    if (won == false) {
      for (int i = 0; i <= 2; i++) {
        if ((tiles[i] == data) && (tiles[i + 3] == data) &&
            (tiles[i + 6] == data)) {
          won = true;
          break;
        }
      }
    }

    // Diagonals
    if (won == false) {
      if ((tiles[0] == data) && (tiles[4] == data) && (tiles[8] == data)) {
        won = true;
      }
    }

    if (won == false) {
      if ((tiles[2] == data) && (tiles[4] == data) && (tiles[6] == data)) {
        won = true;
      }
    }

    // If someone won
    if (won == true) {

      String winner = 'Naughts';
      if (current == 'X') {
        winner = 'Crosses';
        xCount++;
      }else{
        oCount++;
      }

        showDialog<String>(
            context: context,
            builder: (BuildContext context) => OKDialog(
                winner: winner));

    }
  }

  // Determines the heading string
  String getHeading(){
    String heading = 'CROSSES ( X ) Turn';
    if (won == true){
      heading = 'WINNER!';
    }else if (turnNum == 9){
      heading = 'Stalemate - Press Reset';
    }else if (current == 'X') {
      heading = 'NAUGHTS ( O ) Turn';
    }
    return heading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naughts & Crosses'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Column(
          children: [

            // Heading
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(getHeading(),
                style: const TextStyle(fontSize: 24),
              ),
            ),

            // Grid
            SizedBox(
              height: 400,
              child: GridView.count(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: <Widget>[

                  GestureDetector(    // Tile 0
                    onTap: ()
                    {
                      if (tiles[0].isEmpty && won==false) {
                        tap(0);
                        setState((){});
                        hasWon(current);
                      }
                    },
                    child: MyTile(data: tiles[0], tileColor: Colors.lightBlueAccent),
                  ),

                  GestureDetector(    // Tile 1
                    onTap: ()
                    {
                      if (tiles[1].isEmpty && won==false) {
                        tap(1);
                        setState((){});
                        hasWon(current);
                      }
                    },
                    child: MyTile(data: tiles[1], tileColor: Colors.lightBlue),
                  ),

                  GestureDetector(    // Tile 2
                    onTap: ()
                    {
                      if (tiles[2].isEmpty && won==false) {
                        tap(2);
                        setState((){});
                        hasWon(current);
                      }
                    },
                    child: MyTile(data: tiles[2], tileColor: Colors.lightBlueAccent),
                  ),

                  GestureDetector(    // Tile 3
                    onTap: ()
                    {
                      if (tiles[3].isEmpty && won==false) {
                        tap(3);
                        setState((){});
                        hasWon(current);
                      }
                    },
                    child: MyTile(data: tiles[3], tileColor: Colors.lightBlue),
                  ),

                  GestureDetector(    // Tile 4
                    onTap: ()
                    {
                      if (tiles[4].isEmpty && won==false) {
                        tap(4);
                        setState((){});
                        hasWon(current);
                      }
                    },
                    child: MyTile(data: tiles[4], tileColor: Colors.lightBlueAccent),
                  ),

                  GestureDetector(    // Tile 5
                    onTap: ()
                    {
                      if (tiles[5].isEmpty && won==false) {
                        tap(5);
                        setState((){});
                        hasWon(current);
                      }
                    },
                    child: MyTile(data: tiles[5], tileColor: Colors.lightBlue),
                  ),

                  GestureDetector(    // Tile 6
                    onTap: ()
                    {
                      if (tiles[6].isEmpty && won==false) {
                        tap(6);
                        setState((){});
                        hasWon(current);
                      }
                    },
                    child: MyTile(data: tiles[6], tileColor: Colors.lightBlueAccent),
                  ),

                  GestureDetector(    // Tile 7
                    onTap: ()
                    {
                      if (tiles[7].isEmpty && won==false) {
                        tap(7);
                        setState((){});
                        hasWon(current);
                      }
                    },
                    child: MyTile(data: tiles[7], tileColor: Colors.lightBlue),
                  ),

                  GestureDetector(    // Tile 8
                    onTap: ()
                    {
                      if (tiles[8].isEmpty && won==false) {
                        tap(8);
                        setState((){});
                        hasWon(current);
                      }
                    },
                    child: MyTile(data: tiles[8], tileColor: Colors.lightBlueAccent),
                  ),
                ],
              ),
            ),

            // Win count text
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text('Crosses has $xCount wins',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text('Naughts has $oCount wins',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),

      // Reset Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()
        {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute (
                  builder: (BuildContext context) => const NaughtsCrosses()
              )
          );
        },
        label: const Text('Reset Game'),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}

// Tile construction
class MyTile extends StatelessWidget {
  String data;
  Color tileColor;
  MyTile({required this.data, required this.tileColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: tileColor,
      alignment: Alignment.center,
      child: Text(data,
        style: const TextStyle(fontSize: 100),
      ),
    );
  }
}

// Winner dialog box
class OKDialog extends StatelessWidget {
  final String winner;
  const OKDialog({Key? key, required this.winner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('CONGRATULATIONS\n'
          '$winner has won!',
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

