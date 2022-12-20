// ignore: file_names
import 'package:flutter/material.dart';
import '../extra/CatListItem.dart';
import '../models/Cat.dart';
import '../models/CatViewModel.dart';
// ignore: depend_on_referenced_packages
import 'package:async/async.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  final viewModel = CatViewModel();
  List<Cat> catList = List.empty();
  var loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              /* child: Text(
                'My Profile',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ), */
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // ignore: prefer_const_constructors
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          // ignore: prefer_const_literals_to_create_immutables
                          stops: [
                            0.15,
                            0.9
                          ],
                          // ignore: prefer_const_literals_to_create_immutables
                          colors: [
                            const Color.fromARGB(255, 40, 164, 71),
                            const Color.fromARGB(255, 0, 0, 0)
                          ]),
                      borderRadius: BorderRadius.circular(30)),
                  child: Wrap(
                    children: [
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.all(20),
                        // ignore: prefer_const_constructors
                        child: Align(
                          alignment: Alignment.topRight,
                          // ignore: prefer_const_constructors
                          child: Icon(
                            Icons.edit,
                            // ignore: prefer_const_constructors
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 8, bottom: 48),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Wrap(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text('E-mail: ',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    // ignore: prefer_const_constructors
                                    Text('test@test.dk',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Wrap(
                                  children: [
                                    const Text('Password: ',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        'password'
                                            .replaceAll(RegExp(r"."), "**"),
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  'My cats',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            FutureBuilder(
                future: init(),
                builder: (context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.hasData) {
                    // ignore: avoid_unnecessary_containers
                    return Container(
                      child: RefreshIndicator(
                        onRefresh: ScrollRefresh,
                        child: Column(
                          children: <Widget>[
                            ...catList.map((item) {
                              return CatItem(
                                  id: item.id,
                                  title: item.name,
                                  place: item.place,
                                  reward: item.reward,
                                  date: item.date,
                                  color: Colors.green);
                            }).toList(),
                          ],
                        ),
                      ),
                    );
                  } else {
                    // ignore: prefer_const_constructors
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }

  //The initState() is a method that is called when an object for your stateful
  //widget is created and inserted inside the widget tree. It is basically the
  //entry point for the Stateful Widgets.
  Future<void> init() async {
    return _memoizer.runOnce(() async {
      setState(() {
        loading = true;
      });
      debugPrint(loading.toString());
      await viewModel.reload();
      UpdateList();
      return 'loaded';
    });
  }

  // ignore: non_constant_identifier_names
  Future<bool> ScrollRefresh() async {
    await viewModel.reload();
    UpdateList();
    return true;
  }

  // opdatere listen
  // ignore: non_constant_identifier_names
  void UpdateList() {
    setState(() {
      debugPrint('Updating');
      catList = viewModel.myCats('test');
      loading = false;
    });
  }
}
