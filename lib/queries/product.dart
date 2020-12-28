String productQuery = """
  query Product(\$id: String!) {
    getProductListing(id: \$id) {
      Image
      Name
      Price
      PricingUnit
      MinimumOrder
      Description
      Merchant {
        ID
        Image
        Name
        Address
      }
    }
  }
""";
