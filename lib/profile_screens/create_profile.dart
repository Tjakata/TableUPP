import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../tables/table_topic.dart';

import 'dart:io';

class ProfileCreationScreen extends StatefulWidget
{
  const ProfileCreationScreen({super.key});

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreen();
}

class _ProfileCreationScreen extends State<ProfileCreationScreen> {

  
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController surnameTextEditingController = TextEditingController();
  File? profileImageFile;

  FocusNode nameFocusNode = FocusNode();
  FocusNode surnameFocusNode = FocusNode();

@override
  void dispose() {
    nameFocusNode.dispose();
    surnameFocusNode.dispose();
    super.dispose();
  }

  Future<void> pickProfileImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        profileImageFile = File(pickedImage.path);
      });
    }
  }
    
//final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.green,
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
                        onTap: pickProfileImage, // Implement the upload functionality here
                      
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                            profileImageFile != null ? FileImage(profileImageFile!) : null,
                            backgroundColor: Colors.green,
                            child: profileImageFile == null
                                ? const Icon(Icons.person_outlined, size: 50, color: Colors.white)
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

                      // First Name Input
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'First name',
                          prefixIcon: const Icon(Icons.person_outline_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Last Name Input
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Last name',
                          prefixIcon: const Icon(Icons.person_outline_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Occupation Input
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Occupation',
                          prefixIcon: const Icon(Icons.work_outline_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: <String>['Artist', 'Engineer', 'Graphics Designer']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Handle occupation selection
                        
                        },
                      ),
                      const SizedBox(height: 32),

                      // Gender Dropdown
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          prefixIcon: const Icon(Icons.wc_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: <String>['Male', 'Female']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Handle gender selection
                        },
                      ),
                      const SizedBox(height: 16),

                      // Spacer to push the button to the bottom
                      const Spacer(),

                      // Next Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement next action
                            
                            Navigator.push(context, MaterialPageRoute(builder: (c)=> const TableTopicsScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
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
}
