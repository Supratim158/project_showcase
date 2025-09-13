import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For FilteringTextInputFormatter
import 'package:project_showcase/config/text_field.dart';
import 'package:project_showcase/pages/componets/bottom_nav_bar.dart';
import 'package:project_showcase/pages/home_page.dart';

import '../../config/file_upload_box.dart';
import '../../config/multi_select_chip.dart';
import '../../config/photo_box.dart';
import '../../config/video_upload_box.dart';

class ProjectSubmissionForm extends StatefulWidget {
  const ProjectSubmissionForm({super.key,});

  @override
  State<ProjectSubmissionForm> createState() => _ProjectSubmissionFormState();
}

class _ProjectSubmissionFormState extends State<ProjectSubmissionForm> {
  final _formKey = GlobalKey<FormState>();
  final _projectTitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _projectLink = TextEditingController();
  final _teamMemberController = TextEditingController();
  final _mentorController = TextEditingController();
  final _numberOfMembersController = TextEditingController();

  late List<String> _selectedCategories = [];

  @override
  void dispose() {
    _projectTitleController.dispose();
    _descriptionController.dispose();
    _projectLink.dispose();
    _teamMemberController.dispose();
    _mentorController.dispose();
    _numberOfMembersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              labelText: "Project Title",
              hintText: "Enter your project title",
              errorMessage: "Please enter project title",
              controller: _projectTitleController,
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: "Project Description",
              hintText: "Enter your project description",
              errorMessage: "Please enter description",
              controller: _descriptionController,
              maxLines: null,
              minLines: 5,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: "Project Link (GitHub)",
              hintText: "Enter link",
              errorMessage: "This field is required",
              controller: _projectLink,
              minLines: 1,
            ),

            const SizedBox(height: 16),
            CustomTextField(
              labelText: "Mentor Name",
              hintText: "Enter mentor name",
              errorMessage: "This field is required",
              controller: _mentorController,
              maxLines: null,
              minLines: 1,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: "Number of Members",
              hintText: "Enter number of members",
              errorMessage: "Please enter number of members",
              controller: _numberOfMembersController,
              maxLines: 1,
              keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly]

            ),
            const SizedBox(height: 16),

            // Multi-select Category Chips
            Text("Project Categories"),
            const SizedBox(height: 8),
            MultiSelectChip(
              options: ['IoT', 'AI', 'App', 'Web', 'ML', 'Embedded'],
              onSelectionChanged: (selectedList) {
                setState(() {
                  _selectedCategories = selectedList;
                });
              },
              initialSelected: _selectedCategories,
            ),

            const SizedBox(height: 8),
            Text("Project Photo"),
            PhotoBox(
              onChanged: (images, names) {
                // handle selected photos and names here
              },
            ),
            const SizedBox(height: 16),

            Text("Select Year"),
            const SizedBox(height: 8),
            MultiSelectChip(
              options: ['1st', '2nd', '3rd', '4th'],
              onSelectionChanged: (selectedList) {
                setState(() {
                  _selectedCategories = selectedList;
                });
              },
              initialSelected: _selectedCategories,
            ),

            const SizedBox(height: 8),

            FileUploadBox(
              label: 'Project PPT',
              onFilePicked: (filePath) {
                // Handle picked PPT file (save to controller/state)
              },
            ),
            FileUploadBox(
              label: 'Project Report',
              onFilePicked: (filePath) {
                // Handle picked Report file (save to controller/state)
              },
            ),
            const SizedBox(height: 8),
            Text("Members Photo"),
            PhotoBox(
              onChanged: (images, names) {
                // handle selected photos and names here
              },
            ),

            const SizedBox(height: 8),

            VideoUploadBox(
              label: 'Project Video',
              onVideoPicked: (filePath) {
                // Save or process selected video file path here
              },
            ),



            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Form submitted');
                    print('Selected categories: $_selectedCategories');
                    print('Number of Members: ${_numberOfMembersController.text}');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF77D8E),
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                ),
                icon: const Icon(
                  CupertinoIcons.arrow_right,
                  color: Color(0xFFFE0037),
                ),
                label: const Text('Submit'),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'OR',
                    style: TextStyle(color: Colors.black26),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'See All Projects',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
