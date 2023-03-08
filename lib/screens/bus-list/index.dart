import 'package:eticketpurchase/screens/bus-details/index.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Bus {
  String name;
  int seats;
  Bus({required this.name, required this.seats});
}

class BusListScreen extends StatefulWidget {
  const BusListScreen({Key? key}) : super(key: key);

  @override
  _BusListScreenState createState() => _BusListScreenState();
}

class _BusListScreenState extends State<BusListScreen> {
  List<String> seats = ["1", "4"];
  final List<Bus> _buses = [
    Bus(name: "Bus one", seats: 30),
    Bus(name: "Bus two", seats: 10),
    Bus(name: "Bus three", seats: 100),
  ];

  void _addBus() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newBusName = "";
        return AlertDialog(
          title: Text("Add a Bus"),
          content: TextField(
            autofocus: true,
            onChanged: (value) {
              newBusName = value;
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Add"),
              onPressed: () {
                setState(() {
                  _buses.add(Bus(name: newBusName, seats: getRandomNumber()));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteBus(int index) {
    setState(() {
      _buses.removeAt(index);
    });
  }

  int getRandomNumber() {
  Random random = new Random();
  return random.nextInt(31) + 20;
}

  void _updateBus(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String oldBusName = _buses[index].name;
        String newBusName = oldBusName;
        return AlertDialog(
          title: Text("Update Bus"),
          content: TextField(
            autofocus: true,
            onChanged: (value) {
              newBusName = value;
            },
            controller: TextEditingController(text: oldBusName),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                setState(() {
                  _buses[index].name = newBusName;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<String> numberList(int n) {
  List<String> list = [];

  for (int i = 1; i <= n; i++) {
    list.add(i.toString());
  }

  return list;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of available Buses"),
      ),
      body: ListView.builder(
        itemCount: _buses.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BusDetailScreen(bus: _buses[index].name, seats: numberList( _buses[index].seats),),
                ),
              )
            },
            title: Text(_buses[index].name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _updateBus(index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteBus(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _addBus();
        },
      ),
    );
  }
}
