//import af vigtige packages
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';
import 'package:missingcat_app/pages/CatDetails.dart';

// klasse for CatItem, herunder er der properties
// final: bruges til at hardcode variablens værdier, og det kan ikke,
//ændres i fremtiden

//Stateless widget: er de widgets, hvis tilstand som ikke kan ændres,
//når de først er bygget.

//extends: giver mulighed for at dele egenskaber og metoder meller
//klasser, der ligner.
class CatItem extends StatelessWidget {
  final int id;
  final String title;
  final String place;
  final int reward;
  final int date;
  final Color color;

//const: const of final minder meget om hinanden, forskellen er, at
//const gør viablen konstant fra kompilertiden, bruger man const på
//et objekt gør det objektets hele tilstand fastsat, obejekt med denne
//tilstand vil blive set som "frosset" og fuldstæandig "uforanderligt"

//super(nøgle: nøgle) videresender til konstruktøren af superklassen
//sender parameternøglen videregivet til MyApp til
//superkonstruktørens nøgleparameter (samme som for
//MyApp({Key key})).

//required: dart required parametre er de argumenter, der sendes til en funktion,
// og funktionen eller metoden kræver, at alle dens parametre fulføre kodeblokken
  const CatItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.place,
      required this.reward,
      required this.date,
      required this.color})
      : super(key: key);

//@override:udtrykker hensigten om, at en erklæring skal tilsidesætte en grænseflademetode,
//noget som ikke er synligt fra selve erklæringen udtrykker hensigeten

// Alle widgets består af en metode, og inde i den metode står den kode og design
// man ser på appen

//Child: tager en enkel widget
//children: tager en liste over widget
  @override

  // hele denne Widget, ændre på tekstens størrele og kassernes størrelse
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CatDetails(id: id)));
        },
        child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: <Widget>[
              Container(
                  /* width: 100,
                height: 100,
                child: const Image(
                    image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')), */
                  ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(reward.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(place)
                ],
              ),
              const Flexible(
                fit: FlexFit.tight,
                child: SizedBox(),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(time(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String time() {
    int unix = (date * 1000);
    // ignore: no_leading_underscores_for_local_identifiers
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(unix, isUtc: true);
    var dateFormat = DateFormat.yMd();
    var formatted = dateFormat.format(_time).toString();
    return formatted.toString();
  }
}
