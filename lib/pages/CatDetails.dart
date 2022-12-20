// ignore: file_names
import 'package:flutter/material.dart';
import 'package:missingcat_app/models/CatViewModel.dart';
import 'package:missingcat_app/models/Cat.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

class CatDetails extends StatefulWidget {
  const CatDetails({super.key, required this.id});
  final int id;

  @override
  // ignore: no_logic_in_create_state
  State<CatDetails> createState() => _CatDetailsState(id);
}

class _CatDetailsState extends State<CatDetails> {
  _CatDetailsState(int id) {
    // ignore: prefer_initializing_formals
    this.id = id;
  }

// late: håndhæver en variables begrænsinger ved runtime i stedet for ved compile time,
// og da variablen ikke er definitivt initialiseret, indsættes der et runtime check for at sikre,
// at den er blevet tildelt en værdi, hver gang den læses.
  late int id;
  final viewModel = CatViewModel();
  // ?: kan være null
  late Cat? cat;

  @override
  // denne widget er alt det hvad man kan se, når man klikker på en cat fra listen
  // kommer man ind på en anden side hvor man kan se beskrivelsen af katten
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetCat(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          //Snapshot forenkler adgang til og konvertering af egenskaber i et JSON-lignende objekt,
          //for eksempel et JSON-objekt returneret fra en REST-api-tjeneste.
          if (snapshot.hasData) {
            //Scaffold is a class in flutter which provides many widgets or we
            //can say APIs like Drawer, Snack-Bar, Bottom-Navigation-Bar,
            //Floating-Action-Button, App-Bar, etc. Scaffold will expand or
            //occupy the whole device screen. It will occupy the available space.
            return Scaffold(
              appBar: AppBar(
                title: const Text('Cat Details'),
              ),
              // ignore: avoid_unnecessary_containers
              body: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.black45))),
                        child: Text(
                          // !: betyder, at man er helt sikker på, at den er initialiseret før.
                          cat!.name,
                          style: const TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.black45))),
                        child: Text(
                          cat!.description,
                          style: const TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.black45))),
                        child: Text(
                          cat!.place,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.black45))),
                        child: Text(
                          cat!.reward.toString(),
                          style: const TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.black45))),
                        child: Text(
                          time(),
                          style: const TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 8),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Center(
                              child: Text(
                                'BACK',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Cat Details'),
                ),
                //CircularProgressIndicator: En CircularProgressIndicator er en widget,
                //der viser fremskridt langs en cirkel. Det er en cirkulær statuslinje, der drejer rundt for at angive,
                //at applikationen er optaget eller i venteposition
                // ignore: prefer_const_constructors
                body: Center(child: const CircularProgressIndicator()));
          }
        });
  }

  // furture: En fremtid er et objekt, der repræsenterer resultatet af en asynkron operation
  //og kan have to tilstande: ufuldendt eller fuldført.

  //async: Gør enhver funktion til en asyncfunktion.
  //Indpak automatisk returerklæring i Future.

  // ignore: non_constant_identifier_names
  Future<Cat?> GetCat() async {
    // ignore: no_leading_underscores_for_local_identifiers
    Cat? _cat = await viewModel.getCat(id);
    //cat
    cat = _cat;
    return _cat;
  }

  // dette er en funktion til "date" tiden
  //Antallet af millisekunder siden "Unix-epoken" (UTC).
  String time() {
    int unix = (cat!.date * 1000);
    // ignore: no_leading_underscores_for_local_identifiers
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(unix, isUtc: true);
    //time
    var dateFormat = DateFormat.yMd();
    var formatted = dateFormat.format(_time).toString();
    return formatted.toString();
  }
}
