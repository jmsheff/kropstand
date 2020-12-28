// TODO: Change to lat lng variables to get current location
String nearbyProductsQuery = """
  query Products {
    nearbyListings(lat: 43.661443, lng: -70.261031, radius: 50) {
      ID
      Name
      Image
      Price
      MinimumOrder
      PricingUnit
    } 
  }
""";
