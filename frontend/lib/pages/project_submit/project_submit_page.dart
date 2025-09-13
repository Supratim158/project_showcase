import 'package:flutter/material.dart';
import 'project_submission_form.dart'; // Import the form file

class ProjectSubmitPage extends StatefulWidget {
  const ProjectSubmitPage({super.key});

  @override
  State<ProjectSubmitPage> createState() => _ProjectSubmitPageState();
}

class _ProjectSubmitPageState extends State<ProjectSubmitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF031330), // Dark blue
              Color(0xFF053563), // Lighter dark blue
              Color(0xFF07536C), // Lightest blue
            ],
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100.0, bottom: 60),
              child: Text(
                'Submit Project',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded( // Use Expanded to allow the form to take remaining space
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: const SingleChildScrollView( // Moved SingleChildScrollView here
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ProjectSubmissionForm(),
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