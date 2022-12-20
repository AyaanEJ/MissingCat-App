// ignore: file_names
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //Når brugeren ændrer et tekstfelt med en tilknyttet TextEditingController,
  //opdaterer tekstfeltet værdien,
  //og controlleren giver sine lyttere besked.
  //Lytterne kan derefter læse teksten og markeringsegenskaberne for at lære,
  //hvad brugeren har skrevet, eller hvordan markeringen er blevet opdateret.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  //denne widget er opbygget på, at når jeg klikker på sign up knappen, bliver
  //man ført ind til en anden side, her kan man oprette sig selv, ved at skrive
  // en E-mail, username og password. herefter er der en knap Signup som så
  // opretter brugeren.
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 8),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 1, bottom: 40, right: 12),
                  // ignore: prefer_const_constructors
                  child: Center(
                    // ignore: prefer_const_constructors
                    child: Text('Signup',
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 10),
                          child: TextField(
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              hintText: 'E-mail',
                              border: InputBorder.none,
                            ),
                            controller: emailController,
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 10),
                          child: TextField(
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              hintText: 'Username',
                              border: InputBorder.none,
                            ),
                            obscureText: true,
                            controller: usernameController,
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 10),
                          child: TextField(
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                            //This argument gives us the power to hide the data
                            //entered in the input field.
                            obscureText: true,
                            controller: passwordController,
                          ),
                        ))),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Signup',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
