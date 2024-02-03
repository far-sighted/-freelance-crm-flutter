import 'package:crm/mocks/customer-status.dart';
import 'package:crm/mocks/list-countries.dart';
import 'package:crm/mocks/marital-status.dart';
import 'package:crm/mocks/product.dart';
import 'package:crm/mocks/professional-group.dart';
import 'package:crm/widget/date-picker.dart';
import 'package:crm/widget/drop-down.dart';
import 'package:flutter/material.dart';
import 'package:crm/widget/input.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({Key? key}) : super(key: key);

  @override
  State<ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            const Card(
              elevation: 1,
              shadowColor: Colors.transparent,
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 18),
                  child: Column(
                    children: <Widget>[
                      Input(label: "Email", background: true),
                      SizedBox(height: 10),
                      Input(label: "Title", background: true),
                      SizedBox(height: 10),
                      Input(label: "Birth Name", background: true),
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
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: Input(
                          label: "Last Name",
                          background: true,
                        )),
                        SizedBox(width: 18),
                        Expanded(
                            child: Input(
                          label: "First Name",
                          background: true,
                        ))
                      ],
                    ),
                    const SizedBox(height: 18),
                    DropDown(
                      label: "Gender",
                      items: const <String>["Male", "Female", "Others"],
                      onChanged: (p0) => print(p0),
                      background: true,
                    ),
                    const SizedBox(height: 18),
                    const DatePicker(
                      label: "Brith Date",
                      backgroud: true,
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
          ],
        ),
      ),
    );
  }
}
