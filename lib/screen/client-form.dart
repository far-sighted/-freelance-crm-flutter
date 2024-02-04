import 'package:crm/helper/form-validation.dart';
import 'package:crm/helper/ref-number-generator.dart';
import 'package:crm/mocks/customer-status.dart';
import 'package:crm/mocks/list-countries.dart';
import 'package:crm/mocks/marital-status.dart';
import 'package:crm/mocks/product.dart';
import 'package:crm/mocks/professional-group.dart';
import 'package:crm/model/client.dart';
import 'package:crm/widget/date-picker.dart';
import 'package:crm/widget/drop-down.dart';
import 'package:flutter/material.dart';
import 'package:crm/widget/input.dart';

class ClientForm extends StatefulWidget {
  final String id;
  final String code;

  const ClientForm({super.key, required this.id, required this.code});

  @override
  State<ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  final key = GlobalKey<FormState>();
  Client client = Client();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Form'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_outlined),
            onPressed: () {
              if (key.currentState!.validate()) {
                key.currentState!.save();
                print(client);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Please fill all the required fields"),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_outline,
                color: Theme.of(context).colorScheme.error),
            onPressed: () => print("Delete"),
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
                        controller: TextEditingController(
                            text: NumberGenerator(widget.code, widget.id)
                                .getGeneratedValue),
                        onSaved: (p0) => client.setClientNumber = p0!,
                      ),
                      const SizedBox(height: 8),
                      Input(
                        label: "Account Number",
                        background: true,
                        enabled: false,
                        controller: TextEditingController(
                            text: NumberGenerator(widget.code, widget.id)
                                .getGeneratedValue),
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
                        ),
                        const SizedBox(height: 10),
                        Input(
                          label: "Title",
                          background: true,
                          onSaved: (p0) => client.setTitle = p0!,
                          validator: ValidationMixin().validateTitle,
                        ),
                        const SizedBox(height: 10),
                        Input(
                          label: "Birth Name",
                          background: true,
                          onSaved: (p0) => client.setBirthName = p0!,
                          validator: ValidationMixin().validateBirthName,
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
                          )),
                          const SizedBox(width: 18),
                          Expanded(
                              child: Input(
                            label: "First Name",
                            background: true,
                            onSaved: (p0) => client.setFirstName = p0!,
                            validator:
                                ValidationMixin().validateFirstAndLastName,
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
                        validator: ValidationMixin().validateGenderSelected,
                      ),
                      const SizedBox(height: 18),
                      DatePicker(
                        label: "Brith Date",
                        backgroud: true,
                        onSaved: (p0) => client.setBirthDate = p0!,
                        validator: ValidationMixin().validateDateOfBirth,
                      ),
                      const SizedBox(height: 18),
                      DropDown(
                        label: "Nationality",
                        items: countries,
                        onChanged: (p0) => print(p0),
                        background: true,
                      ),
                      const SizedBox(height: 18),
                      DropDown(
                        label: "Marital Status",
                        items: maritalStatus,
                        onChanged: (p0) => print(p0),
                        background: true,
                      ),
                      const SizedBox(height: 18),
                      const Input(
                        label: "Number of Dependent Children in the Household",
                        keyboardType: TextInputType.number,
                        background: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Card(
                elevation: 1,
                shadowColor: Colors.transparent,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 18),
                  child: Column(children: [
                    Input(
                      label: "Street",
                      background: true,
                    ),
                    SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Input(
                            label: "City",
                            background: true,
                          ),
                        ),
                        SizedBox(width: 18),
                        Expanded(
                          child: Input(
                            label: "House",
                            background: true,
                          ),
                        ),
                        SizedBox(width: 18),
                        Expanded(
                          child: Input(
                            label: "Post Code",
                            background: true,
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
                controller: TextEditingController(text: "Germany"),
              ),
              const SizedBox(height: 18),
              Card(
                elevation: 1,
                shadowColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 14, bottom: 18),
                  child: Row(children: <Widget>[
                    Expanded(
                        child: DropDown(
                      placer: "Type",
                      label: "Type",
                      onChanged: (p0) => print(p0),
                      background: true,
                      items: const <String>["private", "mobile", "business"],
                    )),
                    const SizedBox(width: 18),
                    const Expanded(
                        flex: 2,
                        child: Input(
                          label: "Phone Number",
                          background: true,
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
                        DropDown(
                          label: "Professional Group",
                          items: professionalGroups,
                          onChanged: (p0) => print(p0),
                          background: true,
                        ),
                        const SizedBox(height: 18),
                        DropDown(
                          label: "Type of Residence",
                          items: const <String>["Rent", "Own", "With Parent"],
                          onChanged: (p0) => print(p0),
                          background: true,
                        ),
                        const SizedBox(height: 18),
                        const Input(
                          label: "Monthly Net Income",
                          placeholder: "€",
                          keyboardType: TextInputType.number,
                          background: true,
                        ),
                        const SizedBox(height: 18),
                        const DatePicker(
                          label:
                              "Employed by Current Employer Since/Self-Employed Since",
                          backgroud: true,
                        ),
                        const SizedBox(height: 18),
                        const Input(
                          label: "Industry",
                          background: true,
                        ),
                        const SizedBox(height: 18),
                      ],
                    )),
              ),
              const SizedBox(height: 18),
              Row(
                children: <Widget>[
                  Switch(
                    value: false,
                    onChanged: (p0) => print(p0),
                  ),
                  const SizedBox(width: 18),
                  const Text("Consent to Advertising via Email (Revocable)")
                ],
              ),
              Row(
                children: <Widget>[
                  Switch(
                    value: false,
                    onChanged: (p0) => print(p0),
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
                      DropDown(
                        label: "Products",
                        placer: "Select",
                        items: products,
                        background: true,
                        onChanged: (p0) => print(p0),
                      ),
                      const SizedBox(height: 18),
                      DropDown(
                        label: "Customer Status",
                        placer: "Select Status",
                        items: customerService,
                        onChanged: (p0) => print(p0),
                        background: true,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Input(
                  label: "Customer Advisor: User ID",
                  placeholder: " Customer advisor: user ID"),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
