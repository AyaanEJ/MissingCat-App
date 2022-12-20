// ignore: file_names
import 'package:flutter/material.dart';
import 'package:missingcat_app/extra/CatListItem.dart';
import 'package:missingcat_app/models/CatViewModel.dart';
import 'package:missingcat_app/pages/CreateCat.dart';
// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:missingcat_app/extra/ChipButton.dart';
import 'package:missingcat_app/pages/Signin.dart';
import 'package:missingcat_app/pages/MyPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  //An AsyncMemoizer is used when some function may be run multiple times in
  //order to get its result, but it only actually needs
  //to be run once for its effect
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  final viewModel = CatViewModel();
  var catList = List.empty();
  var loading = false;

// late: håndhæver en variables begrænsinger ved runtime i stedet for ved compile time,
// og da variablen ikke er definitivt initialiseret, indsættes der et runtime check for at sikre,
// at den er blevet tildelt en værdi, hver gang den læses.
  late final chips = [
    //Chip is a material design widget which comes built-in with flutter.
    //It can simply be described as a compact element holding an icon and text,
    //usually a rounded rectangle in the background
    ChipButton(
      title: 'Date',
      function: () {
        Sort();
      },
      checked: 0,
      checkAble: true,
    ),
    ChipButton(
      title: 'Name',
      function: () {
        Sort();
      },
      checked: 0,
      checkAble: true,
    ),
    ChipButton(
      title: 'Place',
      function: () {
        Sort();
      },
      checked: 0,
      checkAble: true,
    ),
    ChipButton(
      title: 'Reward',
      function: () {
        Sort();
      },
      checked: 0,
      checkAble: true,
    ),
  ];

  @override

  //denne wigdet er opbygget på homepage siden, alt hvad man ser når appen først
  // starter op.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //titlen på denne side
        title: const Text('Missing Cats'),
        actions: [
          //De 3 prikker man ser i højre hjørne er denne funktion, når man
          // klikker på den kommer der my profile og log in
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(value: 0, child: Text('My Profile')),
              const PopupMenuItem<int>(value: 1, child: Text('Log in')),
            ];
            // denne kodelinje er en if statement for hvis man klikker på den ene
            // ryger man over til en anden side fx MyPage, eller man kan komme
            // ind på Signin siden.
            //MaterialPageRoute: er en funktion der gør man kommer
            //ind til den anden side
          }, onSelected: (value) {
            if (value == 0) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyPage()));
            } else if (value == 1) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Signin()));
            }
          }),
        ],
      ),
      body: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: 45,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Wrap(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text('Filter'),
                                      actions: [
                                        Padding(
                                          // ignore: prefer_const_constructors
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 8),
                                          child: Container(
                                            // ignore: prefer_const_constructors
                                            decoration: BoxDecoration(
                                                // ignore: prefer_const_constructors
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                            // ignore: prefer_const_constructors
                                            child: TextField(
                                              // ignore: prefer_const_constructors
                                              decoration: InputDecoration(
                                                  hintText: 'Text'),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                            // ignore: prefer_const_constructors
                            child: Chip(
                              label: Text('Filter'),
                            ),
                          ),
                        ),
                        Wrap(
                          children: chips.toList(),
                        )
                      ],
                    );
                  }),
            ),
          ),
          FutureBuilder(
              //The initState() is a method that is called when an object for your
              //stateful widget is created and inserted inside the widget tree.
              //It is basically the entry point for the Stateful Widgets.
              future: init(),
              builder: (context, AsyncSnapshot<void> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: ScrollRefresh,
                      child: !loading
                          //It displays its children one after another in the scroll
                          //direction. the children are required
                          //to fill the ListView.
                          ? ListView.builder(
                              itemCount: catList.length,
                              itemBuilder: (context, index) {
                                final item = catList[index];
                                return CatItem(
                                    id: item.id,
                                    title: item.name,
                                    place: item.place,
                                    reward: item.reward,
                                    date: item.date,
                                    color: Colors.green);
                              },
                            )
                          //CircularProgressIndicator: En CircularProgressIndicator er en widget,
                          //der viser fremskridt langs en cirkel. Det er en cirkulær statuslinje, der drejer rundt for at angive,
                          //at applikationen er optaget eller i venteposition
                          : Center(child: CircularProgressIndicator()),
                    ),
                  );
                } else {
                  // ignore: prefer_const_constructors
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
      //floating action button is a circular icon button that hovers over
      //content to promote a primary action in the application. Floating action
      //buttons are most commonly used in the Scaffold.
      floatingActionButton: 1 == 1
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context)

                    //MaterialPageRoute, man bliver ført ind til siden CreateCat
                    .push(MaterialPageRoute(builder: (context) => CreateCat()));
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  //Asynchronous function is a function that returns the type of Future.

  //The initState() is a method that is called when an object for your stateful
  //widget is created and inserted inside the widget tree
  Future<void> init() async {
    return _memoizer.runOnce(() async {
      setState(() {
        loading = true;
      });
      await viewModel.reload();
      UpdateList();
      return 'loaded';
    });
  }

  //når jeg scroller op i toppen så bliver siden reloadet
  // ignore: non_constant_identifier_names
  Future<bool> ScrollRefresh() async {
    await viewModel.reload();
    UpdateList();
    return true;
  }

  // denne funktione opdatere listen
  // ignore: non_constant_identifier_names
  void UpdateList() {
    setState(() {
      catList = viewModel.catsList;
      ResetSorting();
      loading = false;
    });
  }

  // sorting bliver resetet
  // ignore: non_constant_identifier_names
  void ResetSorting() {
    setState(() {
      for (var i = 0; i < chips.length; i++) {
        chips[i].checked = 0;
      }
    });
  }

  // metode til sorting
  // ignore: non_constant_identifier_names
  void Sort() {
    setState(() {
      loading = true;
      catList = viewModel.sortCats(chips);
      loading = false;
    });
  }
}
