// ignore: file_names
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:missingcat_app/models/Cat.dart';

class CatRepository {
  //URL til cat API
  final String url = "https://anbo-restlostcats.azurewebsites.net/api/Cats";
  // ignore: non_constant_identifier_names
  List<Cat> CatsList = List.empty(growable: true);

  // liste af kattte, som hentes fra API'en
  Future<List<Cat>> getCats() async {
    CatsList = List.empty(growable: true);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        //Listen er en type datatype i Dart-sprog, der fungerer som et objekt.
        //Den kan bruges til at gemme forskellige værdier. I en dynamisk liste
        //kan værdierne være af de samme data eller en kombination af forskellige
        //datatyper (kun int eller kombination af int og streng osv.).

        //Parses the string and returns the resulting Json object
        List<dynamic> myMap = json.decode(response.body);
        // ignore: avoid_function_literals_in_foreach_calls
        myMap.forEach((element) {
          CatsList.add(Cat(
              id: element['id'],
              name: element['name'],
              description: element['description'],
              place: element['place'],
              reward: element['reward'],
              userId: element['userId'],
              date: element['date'],
              pictureUrl: element['pictureUrl']));
        });

        return CatsList.toList(growable: true);
        //return List.empty();
      } catch (e) {
        debugPrint(e.toString());
        return List.empty();
      }
    } else {
      return List.empty();
    }
  }

  // get cat(int id) er en enkel kat
  Future<Cat?> getCat(int id) async {
    // ignore: prefer_interpolation_to_compose_strings
    final response = await http.get(Uri.parse(url + "/" + id.toString()));

    if (response.statusCode == 200) {
      try {
        dynamic myMap = json.decode(response.body);
        Cat cat = Cat(
            id: myMap['id'],
            name: myMap['name'],
            description: myMap['description'],
            place: myMap['place'],
            reward: myMap['reward'],
            userId: myMap['userId'],
            date: myMap['date'],
            pictureUrl: myMap['pictureUrl']);

        return cat;
        //return List.empty();
      } catch (e) {
        debugPrint(e.toString());
        return null;
      }
    } else {
      return null;
    }
  }

  void postCat(Cat cat) async {
    try {
      //Converts object to a JSON string
      String json = jsonEncode(cat);
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: json);
      //The status code of the response
      if (response.statusCode != 201) {
        debugPrint(response.statusCode.toString());
        debugPrint(json);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
