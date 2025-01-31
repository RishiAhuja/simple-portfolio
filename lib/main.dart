import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_portfolio/configs/app_colors.dart';
import 'package:simple_portfolio/extensions/get_mobile.dart';
import 'package:simple_portfolio/widgets/blog_post_list_item.dart';
import 'package:simple_portfolio/widgets/education_timeline.dart';
import 'package:simple_portfolio/widgets/expanded_basic_container.dart';
import 'package:simple_portfolio/widgets/experience_card.dart';
import 'package:simple_portfolio/widgets/footer.dart';
import 'package:simple_portfolio/widgets/project_card.dart';
import 'package:simple_portfolio/widgets/small_basic_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rishi\'s Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.codGray,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: context.isMobile
                ? double.infinity
                : MediaQuery.of(context).size.width * 0.65,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _AboutMe(),
                  SizedBox(height: 32),
                  _TechStacks(),
                  SizedBox(height: 32),
                  _Projects(),
                  SizedBox(height: 32),
                  _BlogPosts(),
                  SizedBox(height: 32),
                  _Experience(),
                  SizedBox(height: 32),
                  // _Education(),
                  EducationTimeline(),
                  SizedBox(height: 32),
                  _ContactAndSocial(),
                  CustomFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTextStyle(
          style: GoogleFonts.ptMono(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: AppColors.quillGray,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Rishi',
                speed: Duration(milliseconds: 200),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
        SizedBox(height: 8),
        DefaultTextStyle(
          style: GoogleFonts.ptMono(
            fontSize: 18.0,
            color: Colors.grey,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Flutter Developer',
                speed: Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Divider(color: AppColors.darkGrey),
        ),
        SizedBox(height: 10),
        ExpandedBasicContainer(text: "About Me"),
        SizedBox(height: 12),
        Text(
          'Hi, I\'m Rishi, a tech enthusiast from Punjab, India. I work with Flutter mainly. You can find me on Twitter, usually shitposting and writing blogs on hashnode. I\'m open to work!',
          style: GoogleFonts.ptMono(
            fontSize: 16.0,
            color: AppColors.quillGray,
          ),
        ),
      ],
    );
  }
}

class _TechStacks extends StatelessWidget {
  final List<String> technologies = [
    'Dart',
    'Flutter',
    'Firebase',
    'BLoC',
    'Riverpod',
    'Android Studio',
    'C',
    'C++',
    'Zig',
    'Python',
    'HTML',
    'CSS',
    'JavaScript',
    'Node.js',
    'Unity',
    'Bash',
    'Git',
    'GitHub',
    'Linux',
    'Markdown',
    'Arch Linux',
    'Notion',
    'Obsidian'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandedBasicContainer(text: "Tech Stacks"),
        SizedBox(height: 8),
        Wrap(
          spacing: context.isMobile ? 8 : 16,
          runSpacing: context.isMobile ? 8 : 16,
          children: technologies
              .map((tech) => SmallBasicContainer(text: tech))
              .toList(),
        ),
      ],
    );
  }
}

class _Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandedBasicContainer(text: "Projects"),
        SizedBox(height: 16),
        ProjectCard(
          title: 'MacroX',
          description:
              'A highly scalable EDA-based macro blogging platform with comprehensive markdown capabilities and integrated community ecosystem.',
          techStack: [
            'Flutter',
            'Dart',
            'Hive',
            'BLoC',
            'Firebase',
            'Appwrite',
            'GetIt'
          ],
          features: [
            'EDA based Full Markdown editor with live preview',
            'Local & remote blog management',
            'Shows Robust and Clean code management'
          ],
          githubUrl:
              'https://github.com/RishiAhuja/macrox/blob/master/README.md',
        ),
        ProjectCard(
          title: 'SoulBuddy.ai',
          description:
              'AI-powered astrological platform providing personalized spiritual guidance through astrology and numerology.',
          techStack: [
            'Flutter',
            'Dart',
            'AWS',
            'Cassandra',
            'Hive',
            'Datastax',
            'Langflow'
          ],
          features: [
            'AI-powered spiritual chatbot & birth chart analysis',
            'Personalized meditation & ritual recommendations',
            '1st runner-up at Level SuperMind Hack built under 12 hours'
          ],
          githubUrl:
              'https://github.com/RishiAhuja/SoulBuddy.ai/blob/main/README.md',
        ),
        ProjectCard(
          title: 'IPQS',
          description:
              'Intelligent PDF querying system enabling smart document analysis with AI-powered QA capabilities.',
          techStack: ['Flutter', 'Firebase', 'Syncfusion', 'Gemini AI'],
          features: [
            'AI-powered document analysis with reccomendation engine',
            'Multi-citation support system',
            '2nd runner-up at IEEE PEC Hack built under 18 hours'
          ],
          githubUrl: 'https://github.com/RishiAhuja/IPQS/blob/main/README.md',
        ),
        ProjectCard(
          title: 'Blood 4 Life',
          description:
              'Three-way infrastructure facilitating NGO donor connections through a robust blood donation platform.',
          techStack: ['Flutter', 'Firebase', 'Dart'],
          features: [
            'Automated donor-NGO matching',
            'Geographical zone management',
            'Complete admin dashboard'
          ],
          githubUrl: 'https://github.com/RishiAhuja/B4L/blob/master/README.md',
        ),
        ProjectCard(
          title: 'Chat App',
          description:
              'Secure and feature-rich real-time chat application with custom UI elements.',
          techStack: ['Flutter', 'Dart', 'Firebase'],
          features: [
            'Real-time messaging with encryption',
            'Group chat management',
            'Custom chat UI components'
          ],
          githubUrl:
              'https://github.com/RishiAhuja/chat-app/blob/master/README.md',
        ),
        ProjectCard(
          title: 'Book Tracker',
          description:
              'Comprehensive book management application with reading analytics and Google Books integration.',
          techStack: ['Flutter', 'Dart', 'Google Books API'],
          features: [
            'Reading speed analysis & tracking',
            'Dynamic UI based on book covers',
            'Wishlist & progress management'
          ],
          githubUrl:
              'https://github.com/RishiAhuja/bookmarker/blob/master/README.md',
        ),
        ProjectCard(
          title: 'Cube League',
          description:
              'A high-octane indie mobile game featuring 15 challenging levels with unique slow-motion mechanics and customizable player colors.',
          techStack: ['Unity', 'C#'],
          features: [
            '15 progressive difficulty levels',
            'Upgradable and slow-motion mechanics',
            'Player color customization via diamonds'
          ],
          githubUrl: 'https://rishi0.itch.io/cube-league',
        ),
        ProjectCard(
          title: 'Task Genix',
          description:
              'A sophisticated task management platform with Neomorphic design and comprehensive project management capabilities.',
          techStack: ['Flutter', 'Dart', 'Firebase', 'Cloud Functions'],
          features: [
            'Kanban board with drag-drop functionality',
            'Real-time cloud synchronization',
            'Dark/Light theme customization'
          ],
          githubUrl:
              'https://github.com/RishiAhuja/task-genix/blob/master/README.md',
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

// class _Education extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ExpandedBasicContainer(text: "Education"),
//         SizedBox(height: 16),
//         EducationCard(
//           institute:
//               'Dr. B.R. Ambedkar National Institute of Technology, Jalandhar',
//           duration: '2024-present',
//           department: 'Department of Information Technology',
//           achievements: [
//             'Currently pursuing B.Tech',
//           ],
//         ),
//         EducationCard(
//           institute: 'Allen Chandigarh',
//           duration: '2024',
//           department: 'JEE Advanced Preparation',
//           achievements: [
//             'AIR 13xxx rank in JEE Advanced',
//           ],
//         ),
//         EducationCard(
//           institute: 'Manu Vatika School',
//           duration: '2024',
//           department: 'Class XII',
//           achievements: [
//             '91.8% in CBSE Board Examinations',
//           ],
//         ),
//         EducationCard(
//           institute: 'Manu Vatika School',
//           duration: '2021',
//           department: 'Class X',
//           achievements: [
//             '94.8% in CBSE Board Examinations',
//           ],
//         ),
//         SizedBox(height: 16),
//       ],
//     );
//   }
// }

class _BlogPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandedBasicContainer(text: "Blog Posts"),
        SizedBox(height: 16),
        BlogPostList(
            title: 'Getting cracked at Clean and BLoC architecture',
            link:
                'https://rishi2220.hashnode.dev/getting-cracked-at-clean-and-bloc-architecture'),
        SizedBox(height: 16),
        BlogPostList(
            title: 'Getting started at BLoC architecture',
            link:
                'https://rishi2220.hashnode.dev/getting-started-at-bloc-architecture'),
        SizedBox(height: 16),
        BlogPostList(
            title:
                'Resource Management with Probabilistic Scheduling in the Context of Linux',
            link:
                'https://rishi2220.hashnode.dev/resource-management-with-probabilistic-scheduling-in-the-context-of-linux'),
        SizedBox(height: 16),
        BlogPostList(
            title: 'State of the art: ART',
            link: 'https://rishi2220.hashnode.dev/art'),
        SizedBox(height: 16),
        BlogPostList(
            title: 'Comprehensive Arch Linux guide',
            link:
                'https://rishi2220.hashnode.dev/comprehensive-arch-linux-guide'),
        // Add more blog post cards here
      ],
    );
  }
}

class _Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandedBasicContainer(text: "Experiences & Responsibilities"),
        SizedBox(height: 16),
        ExperienceCard(
          role: 'Frontend Intern',
          company: 'Level SuperMind',
          type: 'Internship',
          startDate: DateTime(2025, 1),
          location: 'Remote',
          responsibilities: [
            'Frontend development intern',
          ],
        ),
        ExperienceCard(
          role: 'Core member—Mobile Development',
          company: 'Google Developers Group on Campus - NIT Jalandhar',
          type: 'Self-employed',
          startDate: DateTime(2024, 11),
          location: 'Jalandhar, Punjab, India',
          responsibilities: [
            'Mobile Development lead',
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class _ContactAndSocial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandedBasicContainer(text: "Contact & Social"),
        SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            SmallBasicContainer(
              text: 'Twitter',
              clickLink: 'https://x.com/Rishi2220',
            ),
            SmallBasicContainer(
              text: 'Linkedin',
              clickLink: 'https://www.linkedin.com/in/rishi-ahuja-b1a224310/',
            ),
            SmallBasicContainer(
              text: 'Hashnode',
              clickLink: 'https://rishi2220.hashnode.dev',
            ),
            SmallBasicContainer(
              text: 'Youtube',
              clickLink: 'https://www.youtube.com/@rishi2220',
            ),
            SmallBasicContainer(
              text: 'Email',
              clickLink: 'mailto:www.rishiahuja@gmail.com',
            ),
          ],
        ),
      ],
    );
  }
}
