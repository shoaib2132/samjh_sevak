import 'package:flutter/material.dart';

import '../../component/card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List demoList = ['test', 'text2'];
List _allLogList = [];
List _filteredList = [];

class _MyHomePageState extends State<MyHomePage> {
  void _filterLogListBySearchText(String searchText) {
    print(searchText);
    setState(() {
      if (searchText.isEmpty) {
        _filteredList = _allLogList;
      } else {
        _filteredList = _allLogList
            .where((logObj) => logObj['id']
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> getList() async {
    //  await Isolate.run(() {
    for (var i = 1; i <= 10000; i++) {
      _allLogList.add({'id': i});
    }

    _filteredList = _allLogList;
    print(_filteredList.length);
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchBar(
                onChanged: _filterLogListBySearchText,
                leading: Icon(Icons.search),
                padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                  horizontal: 20,
                )),
                hintText: 'Type Voter Name',
                elevation: WidgetStatePropertyAll(0.6),
              ),
              // Buttons
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: SizedBox(width: double.infinity, child: ElevatedButton(style: ButtonStyle(), onPressed: () => {}, child: Text('Search')))),
                  const SizedBox(width: 5,),
                  Flexible(child: SizedBox(width: double.infinity, child: ElevatedButton(style: ButtonStyle(), onPressed: () => {}, child: Text('Reset')))),
                  // ElevatedButton(onPressed: () => {}, child: Text('TEst')),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Theme.of(context).primaryColor,
                ),
                height: 30,
                width: double.infinity,
                child: const Center(
                    child: Text(
                  'Voter List',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _filteredList.length,
                    itemBuilder: (context, i) {
                      // return Card(
                      //   child: Text(_filteredList[i]['id'].toString()),
                      // );
                      return const CustomCard();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
