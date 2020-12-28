String userListsQuery = """
  query userLists {
    user {
      Lists {
        Name
        Items {
          Cost
        }
      }
    }
  }
""";