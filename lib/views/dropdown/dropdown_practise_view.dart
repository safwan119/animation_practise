import 'package:animation_practise/widgets/clas/custom_dropdown_value_class.dart';
import 'package:flutter/material.dart';

class DropdownPractiseView extends StatefulWidget {
  const DropdownPractiseView({super.key});

  @override
  State<DropdownPractiseView> createState() => _DropdownPractiseViewState();
}

class _DropdownPractiseViewState extends State<DropdownPractiseView> {
  late Color _themeColor = Colors.white;
  final List<CustomDropdownValueClass> allValueList = [
    CustomDropdownValueClass(color: Colors.black, value: "Black"),
    CustomDropdownValueClass(color: Colors.orangeAccent, value: "Blue"),
    CustomDropdownValueClass(color: Colors.orange, value: "Orange"),
    CustomDropdownValueClass(color: Colors.pink, value: "Pink"),
    CustomDropdownValueClass(color: Colors.yellowAccent, value: "Yellow"),
  ];
  final countries = [
    {"name": "Pakistan", "flag": "🇵🇰"},
    {"name": "India", "flag": "🇮🇳"},
    {"name": "Turkey", "flag": "🇹🇷"},
  ];

  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeColor,
      appBar: AppBar(
        title: Text("Dropdown practise"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: DropdownMenu(
              enableFilter: true,
              enableSearch: true,
              hintText: "Select Color",
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.orange),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              textStyle: TextStyle(color: Colors.white),
              width: double.infinity,
              onSelected: (color) {
                if (color != null) {
                  setState(() {
                    _themeColor = color;
                  });
                }
              },
              dropdownMenuEntries: allValueList
                  .map(
                    (values) => DropdownMenuEntry(
                      value: values.color,
                      label: values.value,
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: Text("Select Country"),
              initialValue: selectedCountry,
              decoration: InputDecoration(
                // labelText: ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              items: countries
                  .map(
                    (value) => DropdownMenuItem(
                      value: value["name"],
                      child: Row(
                        children: [
                          Text(value["flag"]!),
                          const SizedBox(width: 10),
                          Text(value["name"]!),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
