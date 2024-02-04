import 'package:crm/helper/form-validation.dart';
import 'package:crm/helper/ref-number-generator.dart';
import 'package:crm/mocks/customer-status.dart';
import 'package:crm/mocks/industry.dart';
import 'package:crm/mocks/list-countries.dart';
import 'package:crm/mocks/marital-status.dart';
import 'package:crm/mocks/product.dart';
import 'package:crm/mocks/professional-group.dart';
import 'package:crm/model/client.dart';
import 'package:crm/service/client.service.dart';
import 'package:crm/widget/date-picker.dart';
import 'package:crm/widget/drop-down.dart';
import 'package:flutter/material.dart';
import 'package:crm/widget/input.dart';

class ClientForm extends StatefulWidget {
  final String id;
  final String code;
  final String zone;
  final Client? client;

  const ClientForm(
      {super.key,
      required this.id,
      required this.zone,
      required this.code,
      this.client});

  @override
  State<ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  final key = GlobalKey<FormState>();
  Client client = Client();

  late TextEditingController _clientNumberController;
  late TextEditingController _accountNumberController;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _birthNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _numberOfDependentChildrenController =
      TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _houseController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _monthlyNetIncomeController =
      TextEditingController();
  final TextEditingController _employedSinceController =
      TextEditingController();
  final TextEditingController _consentToAdvertisingController =
      TextEditingController();
  final TextEditingController _consentToSchufaTransferController =
      TextEditingController();

  final TextEditingController _customerAdvisorUserIdController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    _clientNumberController = TextEditingController(
      text: NumberGenerator(widget.code, widget.id).getGeneratedValue,
    );

    _accountNumberController = TextEditingController(
      text: NumberGenerator(widget.code, widget.id).getGeneratedValue,
    );

    if (widget.client != null) {
      client = widget.client!;
      _clientNumberController.text = client.clientNumber;
      _accountNumberController.text = client.accountNumber;
      _emailController.text = client.email;
      _titleController.text = client.title;
      _birthNameController.text = client.birthName;
      _lastNameController.text = client.lastName;
      _firstNameController.text = client.firstName;
      _birthDateController.text = client.birthDate.toString();
      _numberOfDependentChildrenController.text =
          client.numberOfDependentChildren.toString();
      _streetController.text = client.street;
      _cityController.text = client.city;
      _houseController.text = client.house;
      _postCodeController.text = client.postCode;
      _phoneNumberController.text = client.phoneNumber;
      _monthlyNetIncomeController.text = client.monthlyNetIncome;
      _employedSinceController.text = client.employedSince.toString();

      _consentToAdvertisingController.text =
          client.consentToAdvertising.toString();
      _consentToSchufaTransferController.text =
          client.consentToSchufaTransfer.toString();

      _customerAdvisorUserIdController.text = client.customerAdvisorUserId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(client.birthName != "" ? client.birthName : 'Client Form'),
        actions: [
          if (widget.client != null)
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState!.save();
                  ClientService().updateClient(
                      client, context, widget.zone, widget.id, widget.code);
                }
              },
            )
          else
            IconButton(
              icon: const Icon(Icons.save_outlined),
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState!.save();
                  ClientService().addClient(
                      client, context, widget.zone, widget.id, widget.code);
                }
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Form(
          key: key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Card(
                elevation: 1,
                shadowColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 14, bottom: 18),
                  child: Column(
                    children: <Widget>[
                      Input(
                        label: "Client Number",
                        background: true,
                        enabled: false,
                        controller: _clientNumberController,
                        onSaved: (p0) => client.setClientNumber = p0!,
                      ),
                      const SizedBox(height: 8),
                      Input(
                        label: "Account Number",
                        background: true,
                        enabled: false,
                        controller: _accountNumberController,
                        onSaved: (p0) => client.setAccountNumber = p0!,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Card(
                elevation: 1,
                shadowColor: Colors.transparent,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 14, bottom: 18),
                    child: Column(
                      children: <Widget>[
                        Input(
                          label: "Email",
                          background: true,
                          onSaved: (p0) => client.setEmail = p0!,
                          validator: ValidationMixin().validateEmail,
                          controller: _emailController,
                        ),
                        const SizedBox(height: 10),
                        Input(
                          label: "Title",
                          background: true,
                          onSaved: (p0) => client.setTitle = p0!,
                          validator: ValidationMixin().validateTitle,
                          controller: _titleController,
                        ),
                        const SizedBox(height: 10),
                        Input(
                          label: "Birth Name",
                          background: true,
                          onSaved: (p0) => client.setBirthName = p0!,
                          validator: ValidationMixin().validateBirthName,
                          controller: _birthNameController,
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 18),
              Card(
                elevation: 1,
                shadowColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 14, bottom: 18),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: Input(
                            label: "Last Name",
                            background: true,
                            onSaved: (p0) => client.setLastName = p0!,
                            validator:
                                ValidationMixin().validateFirstAndLastName,
                            controller: _lastNameController,
                          )),
                          const SizedBox(width: 18),
                          Expanded(
                              child: Input(
                            label: "First Name",
                            background: true,
                            onSaved: (p0) => client.setFirstName = p0!,
                            validator:
                                ValidationMixin().validateFirstAndLastName,
                            controller: _firstNameController,
                          ))
                        ],
                      ),
                      const SizedBox(height: 18),
                      FormField<String>(
                        builder: (FormFieldState<String> state) => DropDown(
                          label: "Gender",
                          items: const <String>["Male", "Female", "Others"],
                          onChanged: (p0) {
                            setState(() {
                              client.setGender = p0!;
                            });
                            state.didChange(p0);
                          },
                          selectedValue:
                              client.gender.isNotEmpty ? client.gender : null,
                          background: true,
                          isError: state.hasError,
                          errorMessage: state.errorText,
                        ),
                        onSaved: (p0) => client.setGender = p0!,
                        initialValue:
                            client.gender.isNotEmpty ? client.gender : null,
                        validator: ValidationMixin().validateGenderSelected,
                      ),
                      const SizedBox(height: 18),
                      DatePicker(
                        label: "Brith Date",
                        background: true,
                        onSaved: (p0) => client.setBirthDate = p0!,
                        validator: ValidationMixin().validateDateOfBirth,
                        initialDate: client.birthDate,
                      ),
                      const SizedBox(height: 18),
                      FormField<String>(
                        builder: (FormFieldState<String> state) => DropDown(
                          label: "Nationality",
                          items: countries,
                          onChanged: (p0) {
                            setState(() {
                              client.setNationality = p0!;
                            });
                            state.didChange(p0);
                          },
                          background: true,
                          selectedValue: client.nationality.isNotEmpty
                              ? client.nationality
                              : null,
                          isError: state.hasError,
                          errorMessage: state.errorText,
                        ),
                        onSaved: (p0) => client.setNationality = p0!,
                        initialValue: client.nationality.isNotEmpty
                            ? client.nationality
                            : null,
                        validator: ValidationMixin().validateNationality,
                      ),
                      const SizedBox(height: 18),
                      FormField<String>(
                          builder: (FormFieldState<String> state) => DropDown(
                                label: "Marital Status",
                                items: maritalStatus,
                                onChanged: (p0) {
                                  setState(() {
                                    client.setMaritalStatus = p0!;
                                  });
                                  state.didChange(p0);
                                },
                                background: true,
                                selectedValue: client.maritalStatus.isNotEmpty
                                    ? client.maritalStatus
                                    : null,
                                isError: state.hasError,
                                errorMessage: state.errorText,
                              ),
                          onSaved: (p0) => client.setMaritalStatus = p0!,
                          initialValue: client.maritalStatus.isNotEmpty
                              ? client.maritalStatus
                              : null,
                          validator: ValidationMixin().validateMartialStatus),
                      const SizedBox(height: 18),
                      Input(
                        label: "Number of Dependent Children in the Household",
                        placeholder: "(optional)",
                        keyboardType: TextInputType.number,
                        background: true,
                        onSaved: (p0) {
                          if (p0 != null && p0.isNotEmpty) {
                            client.setNumberOfDependentChildren = int.parse(p0);
                          } else {
                            client.setNumberOfDependentChildren = 0;
                          }
                        },
                        controller: _numberOfDependentChildrenController,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Card(
                elevation: 1,
                shadowColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 14, bottom: 18),
                  child: Column(children: [
                    Input(
                      label: "Street",
                      background: true,
                      onSaved: (p0) => client.setStreet = p0!,
                      validator: ValidationMixin().validateStreetName,
                      controller: _streetController,
                    ),
                    const SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Input(
                            label: "City",
                            background: true,
                            onSaved: (p0) => client.setCity = p0!,
                            validator: ValidationMixin().validateCity,
                            controller: _cityController,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Input(
                            label: "House",
                            background: true,
                            placeholder: "Number",
                            onSaved: (p0) => client.setHouse = p0!,
                            validator: ValidationMixin().validateHouseNumber,
                            controller: _houseController,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Input(
                            label: "Post Code",
                            background: true,
                            onSaved: (p0) => client.setPostCode = p0!,
                            validator: ValidationMixin().validateGermanZipCode,
                            controller: _postCodeController,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 18),
              Input(
                label: "Country",
                placeholder: "country",
                background: true,
                enabled: false,
                onSaved: (p0) => client.setCountry = "Germany",
                controller: TextEditingController(text: "Germany"),
              ),
              const SizedBox(height: 18),
              Card(
                elevation: 1,
                shadowColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 14, bottom: 18),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: FormField<String>(
                          builder: (FormFieldState<String> state) => DropDown(
                            placer: "Type",
                            label: "Type",
                            onChanged: (p0) {
                              setState(() {
                                client.setType = p0!;
                              });
                              state.didChange(p0);
                            },
                            background: true,
                            items: const <String>[
                              "private",
                              "mobile",
                              "business"
                            ],
                            selectedValue:
                                client.type.isNotEmpty ? client.type : null,
                            isError: state.hasError,
                            errorMessage: state.errorText,
                          ),
                          onSaved: (p0) => client.setType = p0!,
                          validator: ValidationMixin().validatePhoneType,
                          initialValue:
                              client.type.isNotEmpty ? client.type : null,
                        )),
                        const SizedBox(width: 18),
                        Expanded(
                            flex: 2,
                            child: Input(
                              label: "Phone Number",
                              placeholder: "+49...",
                              background: true,
                              keyboardType: TextInputType.phone,
                              onSaved: (p0) => client.setPhoneNumber = p0!,
                              validator:
                                  ValidationMixin().validateGermanPhoneNumber,
                              controller: _phoneNumberController,
                            )),
                      ]),
                ),
              ),
              const SizedBox(height: 18),
              Card(
                elevation: 1,
                shadowColor: Colors.transparent,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 14, bottom: 18),
                    child: Column(
                      children: <Widget>[
                        FormField<String>(
                          builder: (FormFieldState<String> state) => DropDown(
                            label: "Professional Group",
                            items: professionalGroups,
                            onChanged: (p0) {
                              setState(() {
                                client.setProfessionalGroup = p0!;
                              });
                              state.didChange(p0);
                            },
                            background: true,
                            selectedValue: client.professionalGroup.isNotEmpty
                                ? client.professionalGroup
                                : null,
                            isError: state.hasError,
                            errorMessage: state.errorText,
                          ),
                          onSaved: (p0) => client.setProfessionalGroup = p0!,
                          initialValue: client.professionalGroup.isNotEmpty
                              ? client.professionalGroup
                              : null,
                          validator:
                              ValidationMixin().validateProfessionalGroup,
                        ),
                        const SizedBox(height: 18),
                        FormField<String>(
                          builder: (FormFieldState<String> state) => DropDown(
                            label: "Type of Residence",
                            items: const <String>["Rent", "Own", "With Parent"],
                            onChanged: (p0) {
                              setState(() {
                                client.setTypeOfResidence = p0!;
                              });
                              state.didChange(p0);
                            },
                            background: true,
                            selectedValue: client.typeOfResidence.isNotEmpty
                                ? client.typeOfResidence
                                : null,
                            isError: state.hasError,
                            errorMessage: state.errorText,
                          ),
                          onSaved: (p0) => client.setTypeOfResidence = p0!,
                          initialValue: client.typeOfResidence.isNotEmpty
                              ? client.typeOfResidence
                              : null,
                          validator: ValidationMixin().validateTypeOfResidence,
                        ),
                        const SizedBox(height: 18),
                        Input(
                          label: "Monthly Net Income",
                          placeholder: "€",
                          keyboardType: TextInputType.number,
                          background: true,
                          onSaved: (p0) {
                            client.setMonthlyNetIncome = p0!;
                          },
                          validator: ValidationMixin().validateMonthlyNetIncome,
                          controller: _monthlyNetIncomeController,
                        ),
                        const SizedBox(height: 18),
                        DatePicker(
                          label:
                              "Employed by Current Employer Since/Self-Employed Since",
                          background: true,
                          onSaved: (p0) => client.setEmployedSince = p0!,
                          validator: ValidationMixin().validateEmployedSince,
                          initialDate: client.employedSince,
                        ),
                        const SizedBox(height: 18),
                        FormField<String>(
                          builder: (FormFieldState<String> state) => DropDown(
                            label: "Industry",
                            background: true,
                            items: industries,
                            placer: "Select Industry",
                            onChanged: (p0) {
                              setState(() {
                                client.setIndustry = p0!;
                              });
                              state.didChange(p0);
                            },
                            selectedValue: client.industry.isNotEmpty
                                ? client.industry
                                : null,
                            isError: state.hasError,
                            errorMessage: state.errorText,
                          ),
                          onSaved: (p0) => client.setIndustry = p0!,
                          initialValue: client.industry.isNotEmpty
                              ? client.industry
                              : null,
                          validator: ValidationMixin().validateIndustry,
                        ),
                        const SizedBox(height: 18),
                      ],
                    )),
              ),
              const SizedBox(height: 18),
              Row(
                children: <Widget>[
                  Switch(
                    value: client.consentToAdvertising,
                    onChanged: (p0) {
                      setState(() {
                        client.setConsentToAdvertising = p0;
                      });
                    },
                  ),
                  const SizedBox(width: 18),
                  const Text("Consent to Advertising via Email (Revocable)")
                ],
              ),
              Row(
                children: <Widget>[
                  Switch(
                    value: client.consentToSchufaTransfer,
                    onChanged: (p0) {
                      setState(() {
                        client.setConsentToSchufaTransfer = p0;
                      });
                    },
                  ),
                  const SizedBox(width: 18),
                  const Text("Consent to transfer data to Schufa (Revocable)")
                ],
              ),
              const SizedBox(height: 18),
              Card(
                elevation: 1,
                shadowColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 14, bottom: 18),
                  child: Column(
                    children: <Widget>[
                      FormField<String>(
                        builder: (FormFieldState<String> state) => DropDown(
                          label: "Products",
                          placer: "Select",
                          items: products,
                          background: true,
                          onChanged: (p0) {
                            setState(() {
                              client.setProducts = p0!;
                            });
                            state.didChange(p0);
                          },
                          selectedValue: client.products.isNotEmpty
                              ? client.products
                              : null,
                          isError: state.hasError,
                          errorMessage: state.errorText,
                        ),
                        onSaved: (p0) => client.setProducts = p0!,
                        initialValue:
                            client.products.isNotEmpty ? client.products : null,
                        validator: ValidationMixin().validateProducts,
                      ),
                      const SizedBox(height: 18),
                      FormField<String>(
                        builder: (FormFieldState<String> state) => DropDown(
                          label: "Customer Status",
                          placer: "Select Status",
                          items: customerService,
                          onChanged: (p0) {
                            setState(() {
                              client.setCustomerStatus = p0!;
                            });
                            state.didChange(p0);
                          },
                          background: true,
                          selectedValue: client.customerStatus.isNotEmpty
                              ? client.customerStatus
                              : null,
                          isError: state.hasError,
                          errorMessage: state.errorText,
                        ),
                        onSaved: (p0) => client.setCustomerStatus = p0!,
                        initialValue: client.customerStatus.isNotEmpty
                            ? client.customerStatus
                            : null,
                        validator: ValidationMixin().validateCustomerStatus,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Input(
                label: "Customer Advisor: User ID",
                placeholder: " Customer advisor: user ID",
                onSaved: (p0) => client.setCustomerAdvisorUserId = p0!,
                controller: _customerAdvisorUserIdController,
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
