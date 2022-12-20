//import af vigtige packages
import 'package:flutter/material.dart';

//StatefulWidget: De widgets, hvis tilstand kan ændres, når de er bygget, kaldes stateful Widgets.
//Disse tilstande er foranderlige og kan ændres flere gange i deres levetid.
//Dette betyder ganske enkelt, at tilstanden af ​​en app kan ændre sig flere gange
//med forskellige sæt af variabler, input, data.
// ignore: must_be_immutable
class ChipButton extends StatefulWidget {
  final String title;
  // ignore: prefer_typing_uninitialized_variables
  final function;
  int checked;
  // ignore: prefer_typing_uninitialized_variables
  var checkAble;

  //Chip is a material design widget which comes built-in with flutter.
  //It can simply be described as a compact element holding an icon and text,
  //usually a rounded rectangle in the background
  ChipButton(
      {Key? key,
      required this.title,
      required this.function,
      required this.checked,
      required this.checkAble})
      : super(key: key);

  @override
  // frameworket kalder createState når den laver en statefulwidget, det betyder
  // at flere state-objekter kan være knutte til den samme statefulwidget
  // hvis den er indsat i widget træet flere steder.
  State<ChipButton> createState() =>
      // ignore: no_logic_in_create_state
      _ChipButtonState(title: title, function: function, checkAble: checkAble);
}

class _ChipButtonState extends State<ChipButton> {
  final String title;
  // ignore: prefer_typing_uninitialized_variables
  final function;
  // ignore: prefer_typing_uninitialized_variables
  var checkAble;

  _ChipButtonState(
      {required this.title, required this.function, required this.checkAble});

  @override
  // knapperne man ser i topppen filter,date,reward,name,place er chipbuttons
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: () {
          setState(() {
            // denne funktion checker for hvis det er muligt at trykke på den
            (widget.checked + 1) > 2 ? widget.checked = 0 : widget.checked++;
          });
          function();
        },
        child: Chip(
          avatar: checkAble
              ? (widget.checked > 0
                  ? (widget.checked == 1

                      // rund knap
                      ? const CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(Icons.arrow_downward))
                      : const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          child: Icon(Icons.arrow_upward)))
                  : null)
              : null,
          label: Text(title),
        ),
      ),
    );
  }
}
