// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:missingcat_app/repositories/CatRepository.dart';
import 'package:missingcat_app/models/Cat.dart';

class CatViewModel {
  final repository = CatRepository();
  List<Cat> catsList = List.empty();

  //den reloader siden når man tilføjer noget
  Future<void> reload() async {
    catsList = await repository.getCats();
  }

  // furture: En fremtid bruges til at repræsentere en potentiel værdi eller fejl,
  //der vil være tilgængelig på et tidspunkt i fremtiden.

  // furture bliver brugt, da det ikk er noget jeg skal eksekvere nu, men på et
  //senere tidspunkt

  //getcat henter en enekel kat udfra id
  Future<Cat?> getCat(int id) async {
    return await repository.getCat(id);
  }

  //add cat
  void postCat(Cat cat) {
    repository.postCat(cat);
  }

  // sortering af cat
  List<Cat> sortCats(List<dynamic> chips) {
    List<Cat> list = List.empty(growable: true);

    // ignore: avoid_function_literals_in_foreach_calls
    catsList.forEach((element) {
      list.add(element);
    });

    if (chips[0].checked == 1) {
      list.sort((a, b) => a.date.compareTo(b.date));
    } else if (chips[0].checked == 2) {
      list.sort((a, b) => b.date.compareTo(a.date));
    }

    if (chips[1].checked == 1) {
      list.sort((a, b) => a.name.compareTo(b.name));
    } else if (chips[1].checked == 2) {
      list.sort((a, b) => b.name.compareTo(a.name));
    }

    if (chips[2].checked == 1) {
      list.sort((a, b) => b.place.compareTo(a.place));
    } else if (chips[2].checked == 2) {
      list.sort((a, b) => a.place.compareTo(b.place));
    }

    if (chips[3].checked == 1) {
      list.sort((a, b) => b.reward.compareTo(a.reward));
    } else if (chips[3].checked == 2) {
      list.sort((a, b) => a.reward.compareTo(b.reward));
    }

    return list;
  }

  // viser ens egene oprettet katte
  List<Cat> myCats(String userId) {
    List<Cat> list = List.empty(growable: true);

    // ignore: avoid_function_literals_in_foreach_calls
    catsList.forEach((element) {
      list.add(element);
    });
    list = list.where((element) => element.userId == userId).toList();
    debugPrint(list.toString());

    return list;
  }
}
