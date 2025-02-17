import 'package:flutter/material.dart';
import 'package:tableupp/presentation/color_manager.dart';
import 'package:tableupp/tables/dinner_tables.dart';

// class CreateTableScreen extends StatefulWidget {
//   @override
//   _CreateTableScreenState createState() => _CreateTableScreenState();
// }

// class _CreateTableScreenState extends State<CreateTableScreen> {

//   final _formKey = GlobalKey<FormState>();
//   String? selectedCity;
//   String? selectedDay;
//   String? selectedTime;
//   String? selectedFormat;
//   String? selectedTableFor;
//   String? selectedRestaurant;
//   String selectedTableType = 'Lunch';
//   String selectedGender = 'Open';

//   // Simulated API data
//   final List<String> cities = [
//     'Cape Town, South Africa',
//     'New York, USA',
//     'Tokyo, Japan'
//   ];
//   final List<String> restaurants = [
//     'The Deli Woodstock',
//     'Cafe Bliss',
//     'Restaurant XYZ'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title:
//             const Text('Create table', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.green,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // City Dropdown
//                 const Text('City', style: TextStyle(fontSize: 16)),
//                 DropdownButtonFormField<String>(
//                   value: selectedCity,
//                   decoration: InputDecoration(
//                     hintText: 'Select Cty',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(50),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(50),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(50),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                   ),
//                   items: cities.map((city) {
//                     return DropdownMenuItem(
//                       value: city,
//                       child: Text(
//                         city,
//                       ),
//                     );
//                   }).toList(),
//                   onChanged: (value) => setState(() => selectedCity = value),
//                   validator: (value) =>
//                       value == null ? 'City is required' : null,
//                 ),
//                 const SizedBox(height: 16),
//                 // Day Dropdown
//                 const Text('Day', style: TextStyle(fontSize: 16)),
//                 DropdownButtonFormField<String>(
//                   value: selectedDay,
//                   decoration: InputDecoration(
//                     hintText: 'Select Day',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                   ),
//                   items: List.generate(
//                     7,
//                     (index) => DropdownMenuItem(
//                       value: DateTime.now()
//                           .add(Duration(days: index))
//                           .toString()
//                           .split(' ')[0],
//                       child: Text(
//                           DateTime.now()
//                               .add(Duration(days: index))
//                               .toLocal()
//                               .toString()
//                               .split(' ')[0],
//                           style: const TextStyle(fontSize: 14)),
//                     ),
//                   ),
//                   onChanged: (value) => setState(() => selectedDay = value),
//                   validator: (value) =>
//                       value == null ? 'Day is required' : null,
//                 ),
//                 const SizedBox(height: 16),
//                 // Time and Format
//                 Row(
//                   children: [
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         value: selectedTime,
//                         decoration: InputDecoration(
//                           hintText: 'Time',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: const BorderSide(color: Colors.green),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: const BorderSide(color: Colors.green),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: const BorderSide(color: Colors.green),
//                           ),
//                         ),
//                         items: ['7:30', '8:00', '8:30', '9:00']
//                             .map((time) => DropdownMenuItem(
//                                 value: time, child: Text(time)))
//                             .toList(),
//                         onChanged: (value) =>
//                             setState(() => selectedTime = value),
//                         validator: (value) =>
//                             value == null ? 'Time is required' : null,
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         value: selectedFormat,
//                         decoration: InputDecoration(
//                           hintText: 'Format',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: const BorderSide(color: Colors.green),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: const BorderSide(color: Colors.green),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: const BorderSide(color: Colors.green),
//                           ),
//                         ),
//                         items: ['AM', 'PM']
//                             .map((format) => DropdownMenuItem(
//                                 value: format, child: Text(format)))
//                             .toList(),
//                         onChanged: (value) =>
//                             setState(() => selectedFormat = value),
//                         validator: (value) =>
//                             value == null ? 'Format is required' : null,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 // Table For Dropdown
//                 const Text('Table for', style: TextStyle(fontSize: 16)),
//                 DropdownButtonFormField<String>(
//                   value: selectedTableFor,
//                   decoration: InputDecoration(
//                     hintText: 'Select number of people',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                   ),
//                   items: ['2', '3', '4', '5', '6']
//                       .map((value) =>
//                           DropdownMenuItem(value: value, child: Text(value)))
//                       .toList(),
//                   onChanged: (value) =>
//                       setState(() => selectedTableFor = value),
//                   validator: (value) =>
//                       value == null ? 'Please select number of people' : null,
//                 ),
//                 const SizedBox(height: 16),
//                 // Restaurant Dropdown
//                 const Text('Select Restaurant', style: TextStyle(fontSize: 16)),
//                 DropdownButtonFormField<String>(
//                   value: selectedRestaurant,
//                   decoration: InputDecoration(
//                     hintText: 'Select restaurant',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                   ),
//                   items: restaurants.map((restaurant) {
//                     return DropdownMenuItem(
//                       value: restaurant,
//                       child: Text(restaurant),
//                     );
//                   }).toList(),
//                   onChanged: (value) =>
//                       setState(() => selectedRestaurant = value),
//                   validator: (value) =>
//                       value == null ? 'Please select a restaurant' : null,
//                 ),
//                 const SizedBox(height: 8),
//                 // Table Type
//                 const Text('Table type', style: TextStyle(fontSize: 16)),
//                 Row(
//                   children: ['Lunch', 'Dinner', 'Drinks']
//                       .map((type) => Expanded(
//                             child: GestureDetector(
//                               onTap: () =>
//                                   setState(() => selectedTableType = type),
//                               child: Container(
//                                 margin: const EdgeInsets.all(4),
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 12),
//                                 decoration: BoxDecoration(
//                                   color: selectedTableType == type
//                                       ? Colors.green
//                                       : Colors.white,
//                                   border: Border.all(color: Colors.green),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 child: Center(
//                                   child: Text(type,
//                                       style: TextStyle(
//                                           color: selectedTableType == type
//                                               ? Colors.white
//                                               : Colors.green)),
//                                 ),
//                               ),
//                             ),
//                           ))
//                       .toList(),
//                 ),
//                 const SizedBox(height: 16),
//                 // Gender
//                 const Text('Gender', style: TextStyle(fontSize: 16)),
//                 Row(
//                   children: ['Open', 'My gender only']
//                       .map((gender) => Expanded(
//                             child: GestureDetector(
//                               onTap: () =>
//                                   setState(() => selectedGender = gender),
//                               child: Container(
//                                 margin: const EdgeInsets.all(4),
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 12),
//                                 decoration: BoxDecoration(
//                                   color: selectedGender == gender
//                                       ? Colors.green
//                                       : Colors.white,
//                                   border: Border.all(color: Colors.green),
//                                   borderRadius: BorderRadius.circular(50),
//                                 ),
//                                 child: Center(
//                                   child: Text(gender,
//                                       style: TextStyle(
//                                           color: selectedGender == gender
//                                               ? Colors.white
//                                               : Colors.green)),
//                                 ),
//                               ),
//                             ),
//                           ))
//                       .toList(),
//                 ),

//                 // const Spacer(),

//                 // Back and Next Buttons
//                 Padding(
//                   padding: const EdgeInsets.only(top: 25.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Back Button
//                       OutlinedButton(
//                         onPressed: () {
//                           // Restaurant Info action
//                         },
//                         style: OutlinedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 16,
//                             horizontal: 32,
//                           ),
//                           side: const BorderSide(color: Colors.grey),
//                         ),
//                         child: const Text(
//                           'Restaurant info',
//                           style: TextStyle(fontSize: 16, color: Colors.grey),
//                         ),
//                       ),
//                       // Next Button
//                       ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             // Perform action on submit
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                   content: Text('Table posted successfully!')),
//                             );
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 16,
//                             horizontal: 32,
//                           ),
//                         ),
//                         child: const Text(
//                           'Post table',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

/*import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class CreateTableScreen extends StatefulWidget {
  @override
  _CreateTableScreenState createState() => _CreateTableScreenState();
}

class _CreateTableScreenState extends State<CreateTableScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCity;
  String? selectedDay;
  String? selectedTime;
  String? selectedFormat;
  String? selectedTableFor;
  String? selectedRestaurant;
  String selectedTableType = 'Lunch';
  String selectedGender = 'Open';

  // Simulated API data
  final List<String> cities = ['Cape Town, South Africa', 'New York, USA', 'Tokyo, Japan'];
  final List<String> restaurants = ['The Deli Woodstock', 'Cafe Bliss', 'Restaurant XYZ'];

  List<String> generateTimeOptions() {
    List<String> timeOptions = [];
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day, 0, 0);
    for (int i = 0; i < 96; i++) {
      DateTime time = startOfDay.add(Duration(minutes: i * 15));
      timeOptions.add(DateFormat('h:mm').format(time));

    }
    return timeOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create table', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dropdown with green border
                const Text('City', style: TextStyle(fontSize: 16)),
                DropdownButtonFormField<String>(
                  value: selectedCity,
                  decoration: InputDecoration(
                    hintText: 'Select City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                  items: cities.map((city) {
                    return DropdownMenuItem(
                      value: city,
                      child: Text(city, style: const TextStyle(fontSize: 14)),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => selectedCity = value),
                  validator: (value) => value == null ? 'City is required' : null,
                ),
                const SizedBox(height: 16),
                // Dropdown for day
                const Text('Day', style: TextStyle(fontSize: 16)),
                DropdownButtonFormField<String>(
                  value: selectedDay,
                  decoration: InputDecoration(
                    hintText: 'Select Day',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                  items: List.generate(
                    7,
                        (index) => DropdownMenuItem(
                      value: DateTime.now().add(Duration(days: index)).toString().split(' ')[0],
                      child: Text(
                          DateTime.now().add(Duration(days: index)).toLocal().toString().split(' ')[0],
                          style: const TextStyle(fontSize: 14)),
                    ),
                  ),
                  onChanged: (value) => setState(() => selectedDay = value),
                  validator: (value) => value == null ? 'Day is required' : null,
                ),
                const SizedBox(height: 16),
                // Time dropdown
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedTime,
                        decoration: InputDecoration(
                          hintText: 'Time',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.green),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.green),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.green),
                          ),
                        ),
                        items: generateTimeOptions().map((time) {
                          return DropdownMenuItem(
                            value: time,
                            child: Text(time, style: const TextStyle(fontSize: 14)),
                          );
                        }).toList(),
                        onChanged: (value) => setState(() => selectedTime = value),
                        validator: (value) => value == null ? 'Time is required' : null,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Format dropdown
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedFormat,
                        decoration: InputDecoration(
                          hintText: 'Format',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.green),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.green),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.green),
                          ),
                        ),
                        items: ['AM', 'PM']
                            .map((format) => DropdownMenuItem(
                          value: format,
                          child: Text(format, style: const TextStyle(fontSize: 14)),
                        ))
                            .toList(),
                        onChanged: (value) => setState(() => selectedFormat = value),
                        validator: (value) => value == null ? 'Format is required' : null,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                // Buttons for Post Table and Restaurant Info
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black, backgroundColor: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // Restaurant Info action
                        },
                        child: const Text('Restaurant Info'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Perform action on submit
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Table posted successfully!')),
                            );
                          }
                        },
                        child: const Text('Post table'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

class CreateTableScreen extends StatefulWidget {
  const CreateTableScreen({super.key});

  @override
  State<CreateTableScreen> createState() => _CreationTableScreen();
}

class _CreationTableScreen extends State<CreateTableScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCity;
  String? selectedDay;
  String? selectedTime;
  String? selectedFormat;
  String? selectedTableFor;
  String? selectedRestaurant;
  String selectedTableType = 'Lunch';
  String selectedGender = 'Open';

  // Simulated API data
  final List<String> cities = [
    'Cape Town, South Africa',
    'New York, USA',
    'Tokyo, Japan'
  ];
  final List<String> restaurants = [
    'The Deli Woodstock',
    'Cafe Bliss',
    'Restaurant XYZ'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            const Text('Create table', style: TextStyle(color: Colors.white)),
        backgroundColor: ColorManager.primary,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 8),

                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text(
                                    'City',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                  value: selectedCity,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide(
                                            color: ColorManager.primary)),
                                  ),
                                  items: cities.map((city) {
                                    return DropdownMenuItem<String>(
                                      value: city,
                                      child: Text(
                                        city,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    // Handle occupation selection
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select city';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text(
                                    'Day',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                  value: selectedDay,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide(
                                            color: ColorManager.primary)),
                                  ),
                                  items: <String>['Sunday', 'Monday']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    // Handle gender selection
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select date';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        value: selectedTime,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                                color: Colors.green),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                                color: Colors.green),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                                color: Colors.green),
                                          ),
                                        ),
                                        items: ['7:30', '8:00', '8:30', '9:00']
                                            .map((time) => DropdownMenuItem(
                                                value: time, child: Text(time)))
                                            .toList(),
                                        onChanged: (value) => setState(
                                            () => selectedTime = value),
                                        validator: (value) => value == null
                                            ? 'Time is required'
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        value: selectedFormat,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                                color: Colors.green),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                                color: Colors.green),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                                color: Colors.green),
                                          ),
                                        ),
                                        items: ['AM', 'PM']
                                            .map((format) => DropdownMenuItem(
                                                value: format,
                                                child: Text(format)))
                                            .toList(),
                                        onChanged: (value) => setState(
                                            () => selectedFormat = value),
                                        validator: (value) => value == null
                                            ? 'Format is required'
                                            : null,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text(
                                    'Table for',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                  value: selectedDay,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide(
                                            color: ColorManager.primary)),
                                  ),
                                  items: <String>['2', '3', '4', '5', '6']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    // Handle gender selection
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select number of people';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text(
                                    'Select restaurant',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                  value: selectedRestaurant,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide(
                                            color: ColorManager.primary)),
                                  ),
                                  items: restaurants.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    // Handle gender selection
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select restaurant';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text(
                                    'Table type',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: ['Lunch', 'Dinner', 'Drinks']
                                      .map((type) => Expanded(
                                            child: GestureDetector(
                                              onTap: () => setState(() =>
                                                  selectedTableType = type),
                                              child: Container(
                                                margin: const EdgeInsets.all(4),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12),
                                                decoration: BoxDecoration(
                                                  color:
                                                      selectedTableType == type
                                                          ? ColorManager.primary
                                                          : Colors.white,
                                                  border: Border.all(
                                                      color:
                                                          ColorManager.primary),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Center(
                                                  child: Text(type,
                                                      style: TextStyle(
                                                          color:
                                                              selectedTableType ==
                                                                      type
                                                                  ? Colors.white
                                                                  : ColorManager
                                                                      .primary)),
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            // Gender
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text(
                                    'Gender',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: ['Open', 'My gender only']
                                      .map((gender) => Expanded(
                                            child: GestureDetector(
                                              onTap: () => setState(() =>
                                                  selectedGender = gender),
                                              child: Container(
                                                margin: const EdgeInsets.all(4),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12),
                                                decoration: BoxDecoration(
                                                  color:
                                                      selectedGender == gender
                                                          ? ColorManager.primary
                                                          : Colors.white,
                                                  border: Border.all(
                                                      color:
                                                          ColorManager.primary),
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: Center(
                                                  child: Text(gender,
                                                      style: TextStyle(
                                                          color:
                                                              selectedGender ==
                                                                      gender
                                                                  ? Colors.white
                                                                  : ColorManager
                                                                      .primary)),
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Spacer to push the button to the bottom
                      const Spacer(),

                      // Next Button
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Back Button
                              OutlinedButton(
                                onPressed: () {
                                  // Restaurant Info action
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 32,
                                  ),
                                  side: const BorderSide(color: Colors.grey),
                                ),
                                child: const Text(
                                  'Restaurant info',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ),
                              // Next Button
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Perform action on submit
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Table posted successfully!')),
                                    );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DinnerTablesScreen()),
                                      );

                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 32,
                                  ),
                                ),
                                child: const Text(
                                  'Post table',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
