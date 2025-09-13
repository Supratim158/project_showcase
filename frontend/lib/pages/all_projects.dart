import 'package:flutter/material.dart';

class Project {
  final String imageAsset;
  final String title;
  final String description;

  Project({
    required this.imageAsset,
    required this.title,
    required this.description,
  });
}

class AllProjects extends StatefulWidget {
  const AllProjects({super.key});

  @override
  State<AllProjects> createState() => _AllProjectsState();
}

class _AllProjectsState extends State<AllProjects> {
  final List<Project> projects = [
    Project(
      imageAsset: 'assets/movies/greyhound.jpg',
      title: 'Project One',
      description: 'Description of project one',
    ),
    Project(
      imageAsset: 'assets/movies/greyhound.jpg',
      title: 'Project Two',
      description: 'Description of project two',
    ),
    Project(
      imageAsset: 'assets/movies/greyhound.jpg',
      title: 'Project Three',
      description: 'Description of project three',
    ),
  ];

  void _openProjectDetails(Project project) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetails(project: project),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Projects'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: InkWell(
              onTap: () => _openProjectDetails(project),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: Image.asset(
                  project.imageAsset,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  project.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(project.description),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProjectDetails extends StatelessWidget {
  final Project project;

  const ProjectDetails({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              project.imageAsset,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              project.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              project.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
