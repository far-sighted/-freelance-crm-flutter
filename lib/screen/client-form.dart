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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Input(label: "Title", placeholder: "title"),
            SizedBox(height: 10),
            Input(label: "Surname", placeholder: "surname"),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Input(
                    label: "Birth Name",
                    placeholder: "Insert your birth name",
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Input(
                    label: "First Name",
                    placeholder: "Insert your first name",
                  ),
                ),
              ],
            ),
            CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.parse("1900-01-01"),
                lastDate: DateTime.now(),
                onDateChanged: (date) => print(date)),
            SizedBox(height: 10),
            Input(label: "Gender", placeholder: "gender"),
            SizedBox(height: 10),
            Input(label: "Street", placeholder: "street"),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Input(label: "City", placeholder: "state"),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Input(label: "House", placeholder: "number"),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Input(label: "Post Code", placeholder: "ZIP"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Input(label: "Country", placeholder: "country"),
            SizedBox(height: 10),
            Input(
                label: "Birth Date",
                placeholder: "birth date",
                keyboardType: TextInputType.datetime),
            SizedBox(height: 10),
            Input(label: "Marital Status", placeholder: "marital status"),
            SizedBox(height: 10),
            Input(
              label: "Nationality (List of Countries)",
              placeholder: "nationality (list of countries)",
            ),
            SizedBox(height: 10),
            Input(
              label: "Phone (+Private / - Mobile / - Business)",
              placeholder: "phone (+private / - mobile / -business)",
            ),
            SizedBox(height: 10),
            Input(label: "Email", placeholder: "email"),
            SizedBox(height: 10),
            Input(
              label: "Consent to Advertising via Email (Revocable)",
              placeholder:
                  "Consent to advertising via email (can be revoked at any time)",
            ),
            SizedBox(height: 10),
            Input(
              label: "Consent to Advertising via Phone (Revocable)",
              placeholder:
                  "Consent to advertising via phone (can be revoked at any time)",
            ),
            SizedBox(height: 10),
            Input(
                label: "Professional Group (Key)",
                placeholder: "Professional group (key)"),
            SizedBox(height: 10),
            Input(
                label: "Self Employed (Yes/No)",
                placeholder: "self employed (yes/no)"),
            SizedBox(height: 10),
            Input(label: "Employed (Yes/No)", placeholder: "employed (yes/no)"),
            SizedBox(height: 10),
            Input(
              label: "Employed by Current Employer Since/Self-Employed Since",
              placeholder:
                  "Employed by current employer since/self-employed since",
            ),
            SizedBox(height: 10),
            Input(label: "Industry (Key)", placeholder: "Industry (key)"),
            SizedBox(height: 10),
            Input(
              label: "Number of Dependent Children in the Household",
              placeholder:
                  "Number of dependent children living in the household",
            ),
            SizedBox(height: 10),
            Input(
                label: "Monthly Net Income",
                placeholder: " Monthly net income"),
            SizedBox(height: 10),
            Input(
              label: "Type of Residence (With Parents, Rented, Owned)",
              placeholder: "Type of residence (with parents, rented, owned)",
            ),
            SizedBox(height: 10),
            Input(label: "Products (Key)", placeholder: "Products (key)"),
            SizedBox(height: 10),
            Input(
              label:
                  "Identification Features (Customer Number, Account Number)",
              placeholder:
                  "Identification features (customer number, account number)",
            ),
            SizedBox(height: 10),
            Input(
              label: "Customer Status",
              placeholder:
                  "Customer status: customer, interested party, contacted non-customer, customer in the opening process (no signature sample yet available), closed",
            ),
            SizedBox(height: 10),
            Input(
                label: "Customer Advisor: User ID",
                placeholder: " Customer advisor: user ID"),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
