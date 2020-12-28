String merchantQuery = """
  query Merchant(\$id: String!) {
    getMerchant(id: \$id) {
      Image
      Name
      Address
      Description
      Location {
        Coordinates
      }
      ProductListings {
        ID
  	  	Name
  	  	Image
  	  	Price
  	  	MinimumOrder
  	  	PricingUnit
      }
    }
  }
""";