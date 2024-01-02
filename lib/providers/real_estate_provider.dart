import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

//Models
import '../models/real_estate_model.dart';

class RealEstateProvider with ChangeNotifier {
  List<RealEstate> _realEstate = [];

  List<RealEstate> get realEstate {
    return [..._realEstate];
  }

  Future<void> loadRealEstates() async {
    String jsonString = await rootBundle.loadString('json/realEstateData.json');
    Map<String, dynamic> extractedData = json.decode(jsonString);
    final List<RealEstate> loadedRealEstates = [];

    extractedData.forEach((realEstateId, realEstateData) {
      loadedRealEstates.add(
        RealEstate(
          id: realEstateId,
          realEstateImageUrl: List.from(realEstateData['realEstateImageUrl']),
          realEstateName: realEstateData['realEstateName'],
          realEstateDescription: realEstateData['realEstateDescription'],
          realEstatePrice: realEstateData['realEstatePrice'],
          realEstateMapLocation: realEstateData['realEstateMapLocation'],
          realEstateRoomsSize: realEstateData['realEstateRoomsSize'],
          stars: realEstateData['stars'],
          isFavorite: realEstateData['isFavorite'],
        ),
      );
    });

    _realEstate = loadedRealEstates.toList();

    notifyListeners();
  }
}
