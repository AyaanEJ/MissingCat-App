// ignore: file_names
import 'package:flutter/material.dart';
import 'package:missingcat_app/models/Cat.dart';
import 'package:missingcat_app/models/CatViewModel.dart';

class CreateCat extends StatefulWidget {
  CreateCat({super.key});

  @override
  State<CreateCat> createState() => _CreateCatState();
}

class _CreateCatState extends State<CreateCat> {
  final viewModel = CatViewModel();

  //Når brugeren ændrer et tekstfelt med en tilknyttet TextEditingController,
  //opdaterer tekstfeltet værdien,
  //og controlleren giver sine lyttere besked.
  //Lytterne kan derefter læse teksten og markeringsegenskaberne for at lære,
  //hvad brugeren har skrevet, eller hvordan markeringen er blevet opdateret.
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final placeController = TextEditingController();
  final rewardController = TextEditingController();

  @override
  // når man klikker på det lille "plus" ikon kommer man ind på en anden side
  // create siden, her kan man tilføje sin "missing cat" ved at udfylde beskrivelsen.
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Cat'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: prefer_const_constructors
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              // ignore: prefer_const_constructors
              child: Text('Create cat',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(hintText: 'Cat name'),
                controller: nameController,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(hintText: 'Cat description'),
                controller: descriptionController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                //InputDecorator displays the visual elements of a Material
                //Design text field around its input child.
                decoration: InputDecoration(hintText: 'Last Seen'),
                controller: placeController,
              ),
            ),
            Padding(
              //EdgeInsets helps create the outer padding or the inner padding for a
              //Widget based on the visual parameters, left, top, right, and bottom.
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(hintText: 'Reward'),
                controller: rewardController,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 48),
              child: GestureDetector(
                onTap: () {
                  CreateeCat();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    // ignore: prefer_const_constructors
                    child: Center(
                      // ignore: prefer_const_constructors
                      child: Text('CREATE',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 24),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    // ignore: prefer_const_constructors
                    child: Center(
                      // ignore: prefer_const_constructors
                      child: Text('BACK',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  // denne metode opretter en kat med dagens dato, også skal man selv
  // udfylde beskrivelse, navn, sidst set, og reward. herefter vil den så poste
  // katte til vores liste, den tager userID, hvor man så under "my profile"
  // kan se den kan man lige har oprettet
  // ignore: non_constant_identifier_names
  void CreateeCat() {
    double unix = (DateTime.now().millisecondsSinceEpoch / 1000);
    Cat cat = Cat(
        id: 0,
        name: nameController.text,
        description: descriptionController.text,
        place: placeController.text,
        reward: int.parse(rewardController.text),
        userId: 'test',
        date: (unix).floor(),
        pictureUrl: 'null');
    viewModel.postCat(cat);
    Navigator.pop(context);
  }
}
