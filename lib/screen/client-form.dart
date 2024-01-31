import 'package:crm/mocks/list-countries.dart';
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
                    )
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
                    placeholder: "street",
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
                          placeholder: "state",
                          background: true,
                        ),
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Input(
                          label: "House",
                          placeholder: "number",
                          background: true,
                        ),
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Input(
                          label: "Post Code",
                          placeholder: "ZIP",
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
            Input(label: "Marital Status", placeholder: "marital status"),
            const SizedBox(height: 18),
            Input(
              label: "Phone (+Private / - Mobile / - Business)",
              placeholder: "phone (+private / - mobile / -business)",
            ),
            const SizedBox(height: 18),
            Input(
              label: "Consent to Advertising via Email (Revocable)",
              placeholder:
                  "Consent to advertising via email (can be revoked at any time)",
            ),
            const SizedBox(height: 18),
            Input(
              label: "Consent to Advertising via Phone (Revocable)",
              placeholder:
                  "Consent to advertising via phone (can be revoked at any time)",
            ),
            const SizedBox(height: 18),
            Input(
                label: "Professional Group (Key)",
                placeholder: "Professional group (key)"),
            const SizedBox(height: 18),
            Input(
                label: "Self Employed (Yes/No)",
                placeholder: "self employed (yes/no)"),
            const SizedBox(height: 18),
            Input(label: "Employed (Yes/No)", placeholder: "employed (yes/no)"),
            const SizedBox(height: 18),
            Input(
              label: "Employed by Current Employer Since/Self-Employed Since",
              placeholder:
                  "Employed by current employer since/self-employed since",
            ),
            const SizedBox(height: 18),
            Input(label: "Industry (Key)", placeholder: "Industry (key)"),
            const SizedBox(height: 18),
            Input(
              label: "Number of Dependent Children in the Household",
              placeholder:
                  "Number of dependent children living in the household",
            ),
            const SizedBox(height: 18),
            Input(
                label: "Monthly Net Income",
                placeholder: " Monthly net income"),
            const SizedBox(height: 18),
            Input(
              label: "Type of Residence (With Parents, Rented, Owned)",
              placeholder: "Type of residence (with parents, rented, owned)",
            ),
            const SizedBox(height: 18),
            Input(label: "Products (Key)", placeholder: "Products (key)"),
            const SizedBox(height: 18),
            Input(
              label:
                  "Identification Features (Customer Number, Account Number)",
              placeholder:
                  "Identification features (customer number, account number)",
            ),
            const SizedBox(height: 18),
            Input(
              label: "Customer Status",
              placeholder:
                  "Customer status: customer, interested party, contacted non-customer, customer in the opening process (no signature sample yet available), closed",
            ),
            const SizedBox(height: 18),
            Input(
                label: "Customer Advisor: User ID",
                placeholder: " Customer advisor: user ID"),
            SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
