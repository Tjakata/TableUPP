import 'dart:ui';

class ColorManager {
  static Color primary = HexColor.fromHex('#25d16b');
  static Color white = HexColor.fromHex('#ffffff');
  static Color black = HexColor.fromHex('#3f3f3f');
  static Color grey = HexColor.fromHex('#878787');
  static Color red = HexColor.fromHex('#ff4141');
}

//convert string color values to color object
extension HexColor on Color {
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    hexColorString.length == 6 ? hexColorString = 'FF$hexColorString' : null;

    if(hexColorString.length == 6){
      hexColorString = 'FF$hexColorString'; //8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}





// // Last Name Input
// TextFormField(
// decoration: InputDecoration(
// labelText: 'Last name',
// prefixIcon: const Icon(Icons.person_outline_outlined),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(30),
// ),
// ),
// ),
// const SizedBox(height: 32),

// // Occupation Input
// DropdownButtonFormField<String>(
// decoration: InputDecoration(
// labelText: 'Occupation',
// prefixIcon: const Icon(Icons.work_outline_outlined),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(30),
// ),
// ),
// icon: const Icon(Icons.keyboard_arrow_down),
// items: <String>['Artist', 'Engineer', 'Graphics Designer']
//     .map((String value) {
// return DropdownMenuItem<String>(
// value: value,
// child: Text(value),
// );
// }).toList(),
// onChanged: (String? newValue) {
// // Handle occupation selection

// },
// ),
// const SizedBox(height: 32),

// // Gender Dropdown
// DropdownButtonFormField<String>(
// decoration: InputDecoration(
// labelText: 'Gender',
// prefixIcon: const Icon(Icons.wc_outlined),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(30),
// ),
// ),
// icon: const Icon(Icons.keyboard_arrow_down),
// items: <String>['Male', 'Female']
//     .map((String value) {
// return DropdownMenuItem<String>(
// value: value,
// child: Text(value),
// );
// }).toList(),
// onChanged: (String? newValue) {
// // Handle gender selection
// },
// ),