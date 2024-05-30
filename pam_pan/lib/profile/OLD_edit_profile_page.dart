import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:pam_pan/bottom_bar.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _numberController;
  String? _selectedGender;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _numberController = TextEditingController();
    _selectedGender = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            MultiSelectDropDown<String>(
              onOptionSelected: (List<ValueItem<String>> selectedOptions) {},
              options: const [
                ValueItem(label: 'Male', value: 'Male'),
                ValueItem(label: 'Female', value: 'Female'),
                ValueItem(label: 'Prefer not to say', value: 'Other'),
              ],
              borderColor: Colors.black45,
              borderWidth: 1,
              hintColor: Colors.black,
              borderRadius: 0,
              fieldBackgroundColor: const Color.fromARGB(255, 255, 250, 240),
              focusedBorderColor: const Color.fromARGB(255, 113, 216, 244),
              dropdownHeight: 150,
              optionTextStyle: const TextStyle(fontSize: 16),
              selectedOptionIcon: const Icon(Icons.check_circle),
              selectionType: SelectionType.multi,
              hint: "Gender",
            ),
            // DropdownButtonFormField<String>(
            //   value: _selectedGender,
            //   onChanged: (newValue) {
            //     setState(() {
            //       _selectedGender = newValue!;
            //     });
            //   },
            //   items: <String>['Male', 'Female', 'Prefer not to say']
            //       .map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   decoration: const InputDecoration(
            //       border: OutlineInputBorder(), labelText: 'Gender'),
            // ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _numberController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Phone Number'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 34, 33, 33),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _requestPermissionAndPickImage,
              child: const Text(
                'Pick Profile Picture',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 34, 33, 33),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_selectedImage != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(_selectedImage!),
              )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Future<void> _requestPermissionAndPickImage() async {
    var status = await Permission.photos.request();
    if (status.isGranted) {
      _pickImage();
    } else {}
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    super.dispose();
  }
}
