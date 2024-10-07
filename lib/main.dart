import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sivakumaran M Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  final String backgroundImageUrl = 'lib/assets/asset1.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Parallax Background
          Positioned.fill(
            child: Image.network(
              backgroundImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(context),
                _buildBodyContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Header with Title and Photo
  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('lib/assets/asset2.jpg'),
          ),
          const SizedBox(height: 12),
          const Text(
            'Sivakumaran M',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            'Flutter Developer | Blockchain Enthusiast',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black.withOpacity(1),
            ),
          ),
        ],
      ),
    );
  }

  // Body Content with Section Layouts
  Widget _buildBodyContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSection('Contact Info', ContactInfo()),
          _buildSection('Education', Education()),
          _buildSection('Experience', Experience()),
          _buildSection('Projects', Projects()),
          _buildSection('Technical Skills', TechnicalSkills()),
          _buildSection('Soft Skills', SoftSkills()),
          _buildSection('Certifications', Certifications()),
          _buildSection('Achievements', Achievements()),
          _buildSection(
              'Position of Responsibilities', PositionOfResponsibilities()),
        ],
      ),
    );
  }

  // Helper function to build sections
  Widget _buildSection(String title, Widget content) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }
}

// Contact Info Section
class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContactLink(
          icon: Icons.phone,
          text: '+91 9741319192',
          url: 'tel:+919741319192',
        ),
        ContactLink(
          icon: Icons.location_on,
          text: 'Bangalore, IN',
        ),
        ContactLink(
          icon: Icons.email,
          text: 'mskmss1516@gmail.com',
          url: 'mailto:mskmss1516@gmail.com',
        ),
        ContactLink(
          icon: Icons.link,
          text: 'LinkedIn',
          url:
              'https://www.linkedin.com/in/siva-kumaran-manivaannan-012a7724a/',
        ),
        ContactLink(
          icon: Icons.code,
          text: 'GitHub',
          url: 'https://github.com/msk1523',
        ),
      ],
    );
  }
}

// Reusable ContactLink Widget
class ContactLink extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? url;

  ContactLink({required this.icon, required this.text, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: url != null ? () => launch(url!) : null,
        child: Row(
          children: [
            Icon(icon, size: 20),
            SizedBox(width: 8),
            Text(text,
                style: TextStyle(
                    fontSize: 16,
                    color: url != null ? Colors.blue : Colors.black)),
          ],
        ),
      ),
    );
  }
}

// Education Section
class Education extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('MVJ College of Engineering, Bangalore',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text('B.Tech, Computer Science and Design Engineering'),
        Text('Nov 2021 - May 2025'),
        Text('CGPA - 8.5'),
      ],
    );
  }
}

// Experience Section
class Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExperienceItem(
          company: 'Library Solutions (DoScience)',
          position: 'Python Developer Intern',
          duration: 'November 2023 - June 2024',
          location: 'Virtual',
          responsibilities: const [
            'Involved in solving backend problems related to the company\'s ongoing project - StoryBox.',
            'Worked on automation and code optimization for the project.',
            'Developed shared components to simplify tasks for fellow developers, boosting efficiency and teamwork.',
            'Increased efficiency by 70% through automation.',
            'Enhanced product performance through backend development.',
          ],
        ),
        SizedBox(height: 16),
        ExperienceItem(
          company: 'Rinex Solutions',
          position: 'Data Science and Machine Learning Intern',
          duration: 'July 2022 - August 2022',
          location: 'Virtual',
          responsibilities: const [
            'Worked with dataset manipulation and prediction using machine learning techniques.',
            'Contributed to projects that increased proficiency in Python and Data Science workflows.',
          ],
        ),
      ],
    );
  }
}

// Reusable ExperienceItem Widget
class ExperienceItem extends StatelessWidget {
  final String company;
  final String position;
  final String duration;
  final String location;
  final List<String> responsibilities;

  ExperienceItem({
    required this.company,
    required this.position,
    required this.duration,
    required this.location,
    required this.responsibilities,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(company,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(position),
        Text('$duration | $location'),
        SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: responsibilities
              .map((r) => Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(child: Text(r)),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

// Projects Section
class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectItem(
          title: 'NFT Tokens | Solidity - Blockchain',
          description: 'Created NFT tokens using Solidity and Solana.',
          details: const [
            'Built using Solidity on RemixIDE for Ethereum and Solana blockchain integration.'
          ],
          githubLink: 'https://github.com/msk1523/Solidity-Blockchain',
        ),
        SizedBox(height: 16),
        ProjectItem(
          title: 'Crypto Currency Development in Remix | Solidity - Blockchain',
          description:
              'Developed cryptocurrency-related projects using RemixIDE.',
          details: const [
            'Implemented Blockchain solutions that enable decentralized and secure transactions.'
          ],
          githubLink: 'https://github.com/msk1523/Solidity-Blockchain',
        ),
      ],
    );
  }
}

// Reusable ProjectItem Widget
class ProjectItem extends StatelessWidget {
  final String title;
  final String description;
  final List<String> details;
  final String githubLink;

  ProjectItem({
    required this.title,
    required this.description,
    required this.details,
    required this.githubLink,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(description),
        SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: details
              .map((d) => Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(child: Text(d)),
                      ],
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () => launch(githubLink),
          child: const Text('GitHub Repository',
              style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline)),
        ),
      ],
    );
  }
}

// Technical Skills Section
class TechnicalSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkillCategory(
          category: 'Frontend Technologies',
          skills: const [
            'HTML',
            'CSS',
            'Bootstrap',
            'JavaScript',
            'SCSS',
            'Webflow',
            'Flutter',
            'Flutterflow',
          ],
        ),
        SkillCategory(
          category: 'Blockchain Technologies',
          skills: const [
            'Solidity',
            'Blockchain',
            'Hyperledger',
            'Ethereum',
            'Rust',
          ],
        ),
        SkillCategory(
          category: 'Backend Technologies',
          skills: const [
            'Django',
            'Flask',
            'Python',
            'REST API',
          ],
        ),
        SkillCategory(
          category: 'Machine Learning and Data Science',
          skills: const ['Python'],
        ),
        SkillCategory(
          category: 'Languages/Courses',
          skills: const [
            'C',
            'C++',
            'JavaScript',
            'DS and Algo',
            'DBMS',
            'OS',
            'Python',
            'Java',
            'Solidity',
            'Dart',
          ],
        ),
      ],
    );
  }
}

// Reusable SkillCategory Widget
class SkillCategory extends StatelessWidget {
  final String category;
  final List<String> skills;

  SkillCategory({required this.category, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 8,
          children: skills.map((skill) => Chip(label: Text(skill))).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

// Soft Skills Section
class SoftSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final softSkills = [
      'Communication',
      'Teamwork',
      'Problem-Solving',
      'Time Management',
      'Team Management',
      'Leadership',
      'Event Management',
      'English Proficiency (Speaking & Writing)',
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: softSkills.map((skill) => Chip(label: Text(skill))).toList(),
    );
  }
}

// Certifications Section
class Certifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final certifications = [
      'Blockchain',
      'Data Science and Machine Learning',
      'Microsoft Azure Data Fundamentals',
      'Frontend and Backend Development',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: certifications
          .map((cert) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('• $cert'),
              ))
          .toList(),
    );
  }
}

// Achievements Section
class Achievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final achievements = [
      'Vice President of the Literature Society of MVJCE (2023-2024)',
      'Student Coordinator for Technical Fest (VertechX) & Cultural Fest (Swayam) at MVJCE',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: achievements
          .map((achievement) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('• $achievement'),
              ))
          .toList(),
    );
  }
}

// Position of Responsibilities Section
class PositionOfResponsibilities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Saahitya (The Literature Society of MVJCE) - Vice President',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
            'As Vice President, I led a club of 200+ literature enthusiasts, organizing events, and guiding students in creative writing.'),
        SizedBox(height: 16),
        Text('Swayam & VertechX 2024 - Student Coordinator',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
            'Coordinated and hosted national-level cultural and technical fests, mentoring students in leadership and team management.'),
      ],
    );
  }
}
