class ValidationMixin {
  ValidationMixin();

  String? validateEmail(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter your email address';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(p0)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateTitle(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter your title';
    }
    return null;
  }

  String? validateBirthName(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter your birth name';
    }

    if (p0.split(' ').length < 2) {
      return 'Please enter your full birth name';
    }
    return null;
  }

  String? validateFirstAndLastName(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter correctly';
    }
    return null;
  }

  String? validateGenderSelected(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please select an appropriate gender';
    }
    return null;
  }

  String? validateDateOfBirth(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please select your date of birth';
    }

    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateTime.parse(p0);

    // Calculate age
    int age = currentDate.year - birthDate.year;

    // Adjust age if birthday hasn't occurred yet this year
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    // Check if age is less than 18
    if (age < 18 || p0 != birthDate.toString()) {
      return 'You must be at least 18 years old';
    }

    return null;
  }

  String? validateNationality(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'verify your nationality';
    }
    return null;
  }

  String? validateMartialStatus(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please select your marital status';
    }
    return null;
  }

  String? validateStreetName(String? p0) {
    if (p0 == null || p0.isEmpty || p0.length < 10) {
      return 'Please enter a valid street name';
    }
    return null;
  }

  String? validateCity(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter your city';
    }

    if (RegExp(r'[0-9]').hasMatch(p0)) {
      return 'Please enter a valid city name';
    }

    return null;
  }

  String? validateHouseNumber(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter your house number';
    }
    return null;
  }

  String? validateGermanZipCode(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter your zip code';
    }
    if (!RegExp(r'^[0-9]{5}$').hasMatch(p0)) {
      return 'Please enter a valid zip code';
    }
    return null;
  }

  String? validatePhoneType(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please select your phone type';
    }
    return null;
  }

  String? validateGermanPhoneNumber(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter your phone number';
    }

    if (!RegExp(r'^\+49[0-9]{10}$').hasMatch(p0)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validateProfessionalGroup(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please select your professional group';
    }
    return null;
  }

  String? validateTypeOfResidence(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please select your type of residence';
    }
    return null;
  }

  String? validateMonthlyNetIncome(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please enter your monthly net income';
    }
    if (!RegExp(r'^[0-9.]+$').hasMatch(p0)) {
      return 'Please enter a valid number for monthly net income';
    }
    return null;
  }

  String? validateEmployedSince(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please select your employment start date';
    }
    return null;
  }

  String? validateIndustry(String? p0) {
    if (p0 == null || p0.isEmpty) {
      return 'Please select your industry';
    }
    return null;
  }

}
