String nearbyMerchantsQuery = """
  query Merchants {
    nearbyMerchants(lat: 43.661443, lng: -70.261031, radius: 50) {
      ID
      Name
      Image
      Address
      Location {
        Coordinates
      }
    } 
  }
""";