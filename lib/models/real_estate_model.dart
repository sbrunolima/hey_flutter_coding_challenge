class RealEstate {
  final String id;
  final List<String> realEstateImageUrl;
  final String realEstateName;
  final String realEstateDescription;
  final String realEstatePrice;
  final String realEstateMapLocation;
  final int realEstateRoomsSize;
  final double stars;
  final bool isFavorite;

  RealEstate({
    required this.id,
    required this.realEstateImageUrl,
    required this.realEstateName,
    required this.realEstateDescription,
    required this.realEstatePrice,
    required this.realEstateMapLocation,
    required this.realEstateRoomsSize,
    required this.stars,
    required this.isFavorite,
  });
}
