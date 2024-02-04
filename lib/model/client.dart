import 'dart:convert';

class Client {
  String? id;
  String clientNumber;
  String accountNumber;
  String email;
  String title;
  String birthName;
  String lastName;
  String firstName;
  String gender;
  DateTime birthDate;
  String nationality;
  String maritalStatus;
  int numberOfDependentChildren;
  String street;
  String city;
  String house;
  String postCode;
  String country;
  String type;
  String phoneNumber;
  String professionalGroup;
  String typeOfResidence;
  double monthlyNetIncome;
  DateTime employedSince;
  String industry;
  bool consentToAdvertising;
  bool consentToSchufaTransfer;
  String products;
  String customerStatus;
  String customerAdvisorUserId;

  Client({
    this.id,
    required this.clientNumber,
    required this.accountNumber,
    required this.email,
    required this.title,
    required this.birthName,
    required this.lastName,
    required this.firstName,
    required this.gender,
    required this.birthDate,
    required this.nationality,
    required this.maritalStatus,
    required this.numberOfDependentChildren,
    required this.street,
    required this.city,
    required this.house,
    required this.postCode,
    required this.country,
    required this.type,
    required this.phoneNumber,
    required this.professionalGroup,
    required this.typeOfResidence,
    required this.monthlyNetIncome,
    required this.employedSince,
    required this.industry,
    required this.consentToAdvertising,
    required this.consentToSchufaTransfer,
    required this.products,
    required this.customerStatus,
    required this.customerAdvisorUserId,
  });

// getters and setters

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientNumber': clientNumber,
      'accountNumber': accountNumber,
      'email': email,
      'title': title,
      'birthName': birthName,
      'lastName': lastName,
      'firstName': firstName,
      'gender': gender,
      'birthDate': birthDate.toIso8601String(),
      'nationality': nationality,
      'maritalStatus': maritalStatus,
      'numberOfDependentChildren': numberOfDependentChildren,
      'street': street,
      'city': city,
      'house': house,
      'postCode': postCode,
      'country': country,
      'type': type,
      'phoneNumber': phoneNumber,
      'professionalGroup': professionalGroup,
      'typeOfResidence': typeOfResidence,
      'monthlyNetIncome': monthlyNetIncome,
      'employedSince': employedSince.toIso8601String(),
      'industry': industry,
      'consentToAdvertising': consentToAdvertising,
      'consentToSchufaTransfer': consentToSchufaTransfer,
      'products': products,
      'customerStatus': customerStatus,
      'customerAdvisorUserId': customerAdvisorUserId,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      clientNumber: map['clientNumber'] as String,
      accountNumber: map['accountNumber'] as String,
      email: map['email'] as String,
      title: map['title'] as String,
      birthName: map['birthName'] as String,
      lastName: map['lastName'] as String,
      firstName: map['firstName'] as String,
      gender: map['gender'] as String,
      birthDate: DateTime.parse(map['birthDate'] as String),
      nationality: map['nationality'] as String,
      maritalStatus: map['maritalStatus'] as String,
      numberOfDependentChildren: map['numberOfDependentChildren'] as int,
      street: map['street'] as String,
      city: map['city'] as String,
      house: map['house'] as String,
      postCode: map['postCode'] as String,
      country: map['country'] as String,
      type: map['type'] as String,
      phoneNumber: map['phoneNumber'] as String,
      professionalGroup: map['professionalGroup'] as String,
      typeOfResidence: map['typeOfResidence'] as String,
      monthlyNetIncome: map['monthlyNetIncome'] as double,
      employedSince: DateTime.parse(map['employedSince'] as String),
      industry: map['industry'] as String,
      consentToAdvertising: map['consentToAdvertising'] as bool,
      consentToSchufaTransfer: map['consentToSchufaTransfer'] as bool,
      products: map['products'] as String,
      customerStatus: map['customerStatus'] as String,
      customerAdvisorUserId: map['customerAdvisorUserId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) =>
      Client.fromMap(json.decode(source) as Map<String, dynamic>);

  // Getters
  String get getClientNumber => clientNumber;
  String get getAccountNumber => accountNumber;
  String get getEmail => email;
  String get getTitle => title;
  String get getBirthName => birthName;
  String get getLastName => lastName;
  String get getFirstName => firstName;
  String get getGender => gender;
  DateTime get getBirthDate => birthDate;
  String get getNationality => nationality;
  String get getMaritalStatus => maritalStatus;
  int get getNumberOfDependentChildren => numberOfDependentChildren;
  String get getStreet => street;
  String get getCity => city;
  String get getHouse => house;
  String get getPostCode => postCode;
  String get getCountry => country;
  String get getType => type;
  String get getPhoneNumber => phoneNumber;
  String get getProfessionalGroup => professionalGroup;
  String get getTypeOfResidence => typeOfResidence;
  double get getMonthlyNetIncome => monthlyNetIncome;
  DateTime get getEmployedSince => employedSince;
  String get getIndustry => industry;
  bool get getConsentToAdvertising => consentToAdvertising;
  bool get getConsentToSchufaTransfer => consentToSchufaTransfer;
  String get getProducts => products;
  String get getCustomerStatus => customerStatus;
  String get getCustomerAdvisorUserId => customerAdvisorUserId;

  // Setters
  set setClientNumber(String value) => clientNumber = value;
  set setAccountNumber(String value) => accountNumber = value;
  set setEmail(String value) => email = value;
  set setTitle(String value) => title = value;
  set setBirthName(String value) => birthName = value;
  set setLastName(String value) => lastName = value;
  set setFirstName(String value) => firstName = value;
  set setGender(String value) => gender = value;
  set setBirthDate(DateTime value) => birthDate = value;
  set setNationality(String value) => nationality = value;
  set setMaritalStatus(String value) => maritalStatus = value;
  set setNumberOfDependentChildren(int value) =>
      numberOfDependentChildren = value;
  set setStreet(String value) => street = value;
  set setCity(String value) => city = value;
  set setHouse(String value) => house = value;
  set setPostCode(String value) => postCode = value;
  set setCountry(String value) => country = value;
  set setType(String value) => type = value;
  set setPhoneNumber(String value) => phoneNumber = value;
  set setProfessionalGroup(String value) => professionalGroup = value;
  set setTypeOfResidence(String value) => typeOfResidence = value;
  set setMonthlyNetIncome(double value) => monthlyNetIncome = value;
  set setEmployedSince(DateTime value) => employedSince = value;
  set setIndustry(String value) => industry = value;
  set setConsentToAdvertising(bool value) => consentToAdvertising = value;
  set setConsentToSchufaTransfer(bool value) => consentToSchufaTransfer = value;
  set setProducts(String value) => products = value;
  set setCustomerStatus(String value) => customerStatus = value;
  set setCustomerAdvisorUserId(String value) => customerAdvisorUserId = value;

}
