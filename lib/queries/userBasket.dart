String userBasketQuery = """
  query userBasket {
    user {
      Basket {
        Items {
          Item {
            ID
            Name
            Image
            Price
            MinimumOrder
            PricingUnit
          }
        }
      }
    }
  }
""";
