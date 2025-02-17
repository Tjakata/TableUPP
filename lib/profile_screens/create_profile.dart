import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:mime/mime.dart';
import 'package:tableupp/presentation/color_manager.dart';
import '../tables/create_table.dart';
import '../tables/table_topic.dart';


/*class ProfileCreationScreen extends StatefulWidget {
  const ProfileCreationScreen({super.key});

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreen();
}

class _ProfileCreationScreen extends State<ProfileCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _surnameTextEditingController =
      TextEditingController();
 *//* final TextEditingController _occupationTextEditingControlle =
      TextEditingController();
  final TextEditingController _genderTextEditingController =
      TextEditingController();*//*
  File? profileImageFile;
  String? selectedGender;
  String? selectedOccupation;

  Future<void> pickProfileImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        profileImageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 10,
        backgroundColor: ColorManager.primary,
        elevation: 0,
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
                      // Profile Picture Section
                      GestureDetector(
                        onTap:
                            pickProfileImage, // Implement the upload functionality here

                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: profileImageFile != null
                              ? FileImage(profileImageFile!)
                              : null,
                          backgroundColor: ColorManager.primary,
                          child: profileImageFile == null
                              ? const Icon(Icons.person_outlined,
                                  size: 50, color: Colors.white)
                              : null,
                        ),
                      ),

                      const SizedBox(height: 8),
                      const Center(
                        child: Text(
                          'Upload profile picture',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

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
                                    'First name',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _nameTextEditingController,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                        Icons.person_outline_outlined),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 32),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text(
                                    'Last name',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _surnameTextEditingController,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                        Icons.person_outline_outlined),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your last name';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 32),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text(
                                    'Occupation',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                  value: selectedOccupation,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.work_outline),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  items: <String>[
                                    'Farmer',
                                    'Graphics desiner',
                                    'Doctor'
                                  ].map((String value) {
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
                                    // Handle occupation selection
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select occupation';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),

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
                                DropdownButtonFormField<String>(
                                  value: selectedGender,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.people_outline),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  items: <String>['Male', 'Female']
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
                                      return 'Please select a gender';
                                    }
                                    return null;
                                  },
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
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (c) => const TableTopicsScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(fontSize: 18),
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
}*/


class ProfileCreationScreen extends StatefulWidget {
  const ProfileCreationScreen({super.key});

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreenState();
}

class _ProfileCreationScreenState extends State<ProfileCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  File? profileImageFile;
  String? selectedGender;
  String? selectedOccupation;

  Future<void> pickProfileImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        profileImageFile = File(pickedImage.path);
      });
    }
  }

  void _submitProfile() {
    if (profileImageFile == null) {
      /*ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload a profile picture'),
          backgroundColor: Colors.red,
        ),
      );*/

      return;
    }

    if (_formKey.currentState!.validate()) {
      // Save user profile details to the backend or local storage
      Map<String, dynamic> userProfile = {
        'user_id': 1, // Replace with the actual user ID from sign-up
        'profileImage': profileImageFile!.path,
        'firstName': _firstNameController.text.trim(),
        'lastName': _lastNameController.text.trim(),
        'occupation': selectedOccupation,
        'gender': selectedGender,
      };

      print("User Profile: $userProfile");

      // Proceed to the next screen
      // Navigator.push(context, MaterialPageRoute(builder: (c) => NextScreen()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 10,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileImagePicker(
                imageFile: profileImageFile,
                onImagePicked: pickProfileImage,
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _firstNameController,
                      label: 'First Name',
                      icon: Icons.person_outline_outlined,
                      validatorMsg: 'Please enter your first name',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _lastNameController,
                      label: 'Last Name',
                      icon: Icons.person_outline_outlined,
                      validatorMsg: 'Please enter your last name',
                    ),
                    const SizedBox(height: 16),
                    CustomDropdown(
                      label: 'Occupation',
                      icon: Icons.work_outline,
                      items: ['Farmer', 'Graphic Designer', 'Doctor'],
                      value: selectedOccupation,
                      onChanged: (value) => setState(() {
                        selectedOccupation = value;
                      }),
                    ),
                    const SizedBox(height: 16),
                    CustomDropdown(
                      label: 'Gender',
                      icon: Icons.people_outline,
                      items: ['Male', 'Female'],
                      value: selectedGender,
                      onChanged: (value) => setState(() {
                        selectedGender = value;
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTableScreen()),);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Next', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImagePicker extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onImagePicked;

  const ProfileImagePicker({
    Key? key,
    required this.imageFile,
    required this.onImagePicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onImagePicked,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
            backgroundColor: Colors.green,
            child: imageFile == null
                ? const Icon(Icons.person_outlined, size: 50, color: Colors.white)
                : null,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Upload profile picture',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String validatorMsg;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.validatorMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorMsg;
            }
            return null;
          },
        ),
      ],
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String label;
  final IconData icon;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.icon,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please select $label';
            }
            return null;
          },
        ),
      ],
    );
  }
}
