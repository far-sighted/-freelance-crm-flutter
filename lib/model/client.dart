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
  DateTime? birthDate;
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
  String monthlyNetIncome;
  DateTime? employedSince;
  String industry;
  bool consentToAdvertising;
  bool consentToSchufaTransfer;
  String products;
  String customerStatus;
  String customerAdvisorUserId;

  String? zoneID;

  Client({
    this.id,
    this.clientNumber = "",
    this.accountNumber = "",
    this.email = "",
    this.title = "",
    this.birthName = "",
    this.lastName = "",
    this.firstName = "",
    this.gender = "",
    this.birthDate,
    this.nationality = "",
    this.maritalStatus = "",
    this.numberOfDependentChildren = 0,
    this.street = "",
    this.city = "",
    this.house = "",
    this.postCode = "",
    this.country = "",
    this.type = "",
    this.phoneNumber = "",
    this.professionalGroup = "",
    this.typeOfResidence = "",
    this.monthlyNetIncome = "0.0",
    this.employedSince,
    this.industry = "",
    this.consentToAdvertising = false,
    this.consentToSchufaTransfer = false,
    this.products = "",
    this.customerStatus = "",
    this.customerAdvisorUserId = "",

    this.zoneID = "",
  });

  String get getClientNumber => clientNumber;
  set setClientNumber(String value) => clientNumber = value;

  String get getAccountNumber => accountNumber;
  set setAccountNumber(String value) => accountNumber = value;

  String get getEmail => email;
  set setEmail(String value) => email = value;

  String get getTitle => title;
  set setTitle(String value) => title = value;

  String get getBirthName => birthName;
  set setBirthName(String value) => birthName = value;

  String get getLastName => lastName;
  set setLastName(String value) => lastName = value;

  String get getFirstName => firstName;
  set setFirstName(String value) => firstName = value;

  String get getGender => gender;
  set setGender(String value) => gender = value;

  DateTime? get getBirthDate => birthDate;
  set setBirthDate(DateTime value) => birthDate = value;

  String get getNationality => nationality;
  set setNationality(String value) => nationality = value;

  String get getMaritalStatus => maritalStatus;
  set setMaritalStatus(String value) => maritalStatus = value;

  int get getNumberOfDependentChildren => numberOfDependentChildren;
  set setNumberOfDependentChildren(int value) =>
      numberOfDependentChildren = value;

  String get getStreet => street;
  set setStreet(String value) => street = value;

  String get getCity => city;
  set setCity(String value) => city = value;

  String get getHouse => house;
  set setHouse(String value) => house = value;

  String get getPostCode => postCode;
  set setPostCode(String value) => postCode = value;

  String get getCountry => country;
  set setCountry(String value) => country = value;

  String get getType => type;
  set setType(String value) => type = value;

  String get getPhoneNumber => phoneNumber;
  set setPhoneNumber(String value) => phoneNumber = value;

  String get getProfessionalGroup => professionalGroup;
  set setProfessionalGroup(String value) => professionalGroup = value;

  String get getTypeOfResidence => typeOfResidence;
  set setTypeOfResidence(String value) => typeOfResidence = value;

  String get getMonthlyNetIncome => monthlyNetIncome;
  set setMonthlyNetIncome(String value) => monthlyNetIncome = value;

  DateTime? get getEmployedSince => employedSince;
  set setEmployedSince(DateTime value) => employedSince = value;

  String get getIndustry => industry;
  set setIndustry(String value) => industry = value;

  bool get getConsentToAdvertising => consentToAdvertising;
  set setConsentToAdvertising(bool value) => consentToAdvertising = value;

  bool get getConsentToSchufaTransfer => consentToSchufaTransfer;
  set setConsentToSchufaTransfer(bool value) => consentToSchufaTransfer = value;

  String get getProducts => products;
  set setProducts(String value) => products = value;

  String get getCustomerStatus => customerStatus;
  set setCustomerStatus(String value) => customerStatus = value;

  String get getCustomerAdvisorUserId => customerAdvisorUserId;
  set setCustomerAdvisorUserId(String value) => customerAdvisorUserId = value;

  String? get getZoneID => zoneID;
  set setZoneID(String? value) => zoneID = value;  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'clientNumber': clientNumber,
      'accountNumber': accountNumber,
      'email': email,
      'title': title,
      'birthName': birthName,
      'lastName': lastName,
      'firstName': firstName,
      'gender': gender,
      'birthDate': birthDate?.toIso8601String(),
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
      'employedSince': employedSince?.toIso8601String(),
      'industry': industry,
      'consentToAdvertising': consentToAdvertising,
      'consentToSchufaTransfer': consentToSchufaTransfer,
      'products': products,
      'customerStatus': customerStatus,
      'customerAdvisorUserId': customerAdvisorUserId,

      'zoneID': zoneID,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'] as String,
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
      monthlyNetIncome: map['monthlyNetIncome'] as String,
      employedSince: DateTime.parse(map['employedSince'] as String),
      industry: map['industry'] as String,
      consentToAdvertising: map['consentToAdvertising'] as bool,
      consentToSchufaTransfer: map['consentToSchufaTransfer'] as bool,
      products: map['products'] as String,
      customerStatus: map['customerStatus'] as String,
      customerAdvisorUserId: map['customerAdvisorUserId'] as String,

      zoneID: map['zoneID'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) =>
      Client.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Client {\n'
        '  ID: $id\n'
        '  Client Number: $clientNumber\n'
        '  Account Number: $accountNumber\n'
        '  Email: $email\n'
        '  Name: $title $firstName $lastName\n'
        '  Gender: $gender\n'
        '  Birth Date: ${birthDate?.toLocal()}\n'
        '  Nationality: $nationality\n'
        '  Marital Status: $maritalStatus\n'
        '  Number of Dependent Children: $numberOfDependentChildren\n'
        '  Address: $street, $house, $postCode, $city, $country\n'
        '  Type: $type\n'
        '  Phone Number: $phoneNumber\n'
        '  Professional Group: $professionalGroup\n'
        '  Type of Residence: $typeOfResidence\n'
        '  Monthly Net Income: $monthlyNetIncome\n'
        '  Employed Since: ${employedSince?.toLocal()}\n'
        '  Industry: $industry\n'
        '  Consent to Advertising: $consentToAdvertising\n'
        '  Consent to Schufa Transfer: $consentToSchufaTransfer\n'
        '  Products: $products\n'
        '  Customer Status: $customerStatus\n'
        '  Customer Advisor User ID: $customerAdvisorUserId\n'
        '}';
  }
}
