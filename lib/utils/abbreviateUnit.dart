String abbreviateUnit(String unit) {
    switch (unit) {
      case 'COUNT':
        return 'ct';
      case 'POUND':
        return 'lb';
      case 'OUNCE':
        return 'oz';
      default:
        return 'ct';
    }
  }