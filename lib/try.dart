import 'package:flutter/material.dart';

class TryView extends StatefulWidget {
  const TryView({Key? key}) : super(key: key);

  @override
  State<TryView> createState() => _TryViewState();
}

class _TryViewState extends State<TryView> {
  final Map<String, String> marathiNumbers = {
    "1": 'एक',
    "2": 'दोन',
    "3": 'तीन',
    "4": 'चार',
    "5": 'पाच',
    "6": 'सहा',
    "7": 'सात',
    "8": 'आठ',
    "9": 'नऊ',
    "10": 'दहा',
    "11": 'अकरा',
    "12": 'बारा',
    "13": 'तेरा',
    "14": 'चौदा',
    "15": 'पंधरा',
    "16": 'सोळा',
    "17": 'सतरा',
    "18": 'अठरा',
    "19": 'एकोणीस',
    "20": 'वीस',
  };

  List<String> yyy = [];
  List<String> xx = [];
  int dragIndex = 0;
  TextEditingController numberController = TextEditingController();

  void _acceptDraggedItem(int draggedIndex, int targetIndex) {
    setState(() {
      String number = yyy[draggedIndex];
      String marathiNumber = marathiNumbers[number]!;

      if (xx[targetIndex] == marathiNumber) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          padding: EdgeInsets.all(40),
          backgroundColor: Colors.green,
          content: Text(
            'बरोबर जोडी!',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          padding: EdgeInsets.all(40),
          backgroundColor: Colors.red,
          content: Text(
            'चुकीची जोडी!',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ));
      }
    });
  }

  void _generateNumbers() {
    setState(() {
      int maxNumber = int.parse(numberController.text);
      yyy = List.generate(maxNumber, (index) => (index + 1).toString());
      xx = yyy.map((number) => marathiNumbers[number]!).toList();
      xx.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        labelText: "Enter max number",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _generateNumbers,
                    child: Text("Generate"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "संख्या",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 20),
                          ),
                          Expanded(
                            child: GridView.count(
                              shrinkWrap: true,
                              primary: false,
                              crossAxisCount: 2,
                              children: List.generate(yyy.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(44.0),
                                  child: Draggable<int>(
                                    onDragStarted: () => dragIndex = index,
                                    data: index,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(
                                          color: Colors.blue,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          yyy[index],
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    feedback: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          yyy[index],
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "मराठी संख्या",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 20),
                          ),
                          Expanded(
                            child: GridView.count(
                              shrinkWrap: true,
                              primary: false,
                              crossAxisCount: 2,
                              children: List.generate(xx.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(44.0),
                                  child: DragTarget<int>(
                                    builder: (
                                      BuildContext context,
                                      List<dynamic> accepted,
                                      List<dynamic> rejected,
                                    ) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.blue,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          xx[index],
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    onWillAccept: (data) => true,
                                    onAccept: (data) {
                                      _acceptDraggedItem(data, index);
                                    },
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
