//importering af vigtige pakages
// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:missingcat_app/pages/Signup.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Signin> {
  //Når brugeren ændrer et tekstfelt med en tilknyttet TextEditingController,
  //opdaterer tekstfeltet værdien,
  //og controlleren giver sine lyttere besked.
  //Lytterne kan derefter læse teksten og markeringsegenskaberne for at lære,
  //hvad brugeren har skrevet, eller hvordan markeringen er blevet opdateret.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  // denne widget er opgygget for min sig in side, herunderer der 2 tekstfelter
  // username, password, så er der en knap for Sign in, og nedenunder kan man
  //registrerer sig hvis man ikke er et medlem
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign in'),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(top: 24, left: 8, bottom: 48, right: 8),
                  /* hild: Center(
                    child: 
                    Text('Sign in',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                  ), */
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 16),
                          child: TextField(
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              hintText: 'Username',
                              border: InputBorder.none,
                            ),
                            controller: usernameController,
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 16),
                          child: TextField(
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                            ////This argument gives us the power to hide the data
                            //entered in the input field.
                            obscureText: true,
                            controller: passwordController,
                          ),
                        ))),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: TextButton(
                    onPressed: () {},
                    // ignore: prefer_const_constructors
                    child: Text(
                      '',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Sign in',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18)),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Wrap(
                      children: [
                        //Text('Sign up'),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: () {
                              //Navigator widget in Flutter is what we use to
                              //maintain a stack of routes and it plays a huge
                              //role in helping us to navigate between routes.
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Signup()));
                            },
                            child: Text('Sign up',
                                style: TextStyle(color: Colors.green)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
