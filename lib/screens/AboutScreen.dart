import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE6FF), // Light background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF001F3F), // Dark header
        title: const Text('Insightify'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Icon(Icons.group, size: 80, color: Color(0xFF5C43FF)),
              const SizedBox(height: 16),
              const Text(
                "Meet Our Team",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5C43FF),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "At Insightify, we’re a passionate and dynamic group of developers, innovators, and problem-solvers dedicated to crafting cutting-edge solutions. Our team thrives on collaboration, creativity, and a shared vision to empower individuals and businesses with data-driven insights.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 30),
              const Text(
                "Our Team",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5C43FF),
                ),
              ),
              const SizedBox(height: 20),
              // Team Member Cards (Individual Containers)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildTeamMemberCard("Rohan Malakar", "https://github.com/RohanMalakar/Langbridge/blob/main/client/src/assets/Images/Rohan-malakar.jpg?raw=true"),
                    _buildTeamMemberCard("Pradhyum Garashya", "https://raw.githubusercontent.com/RohanMalakar/Langbridge/refs/heads/main/client/src/assets/Images/Pradhyum.jpg"),
                    _buildTeamMemberCard("Brajraj Mishra", "https://raw.githubusercontent.com/RohanMalakar/Langbridge/refs/heads/main/client/src/assets/Images/Brajraj-Mishra.jpg"),
                    _buildTeamMemberCard("Tanuj Jain", "https://github.com/RohanMalakar/Langbridge/blob/main/client/src/assets/Images/Tanuj-jain.jpg?raw=true"),
                    _buildTeamMemberCard("Atul Singh Dhakad", "https://github.com/atulsingh1dhakad/LangBridge/blob/master/assets/images/atulsingh.png?raw=true"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for each team member card
  Widget _buildTeamMemberCard(String name, String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF5C43FF), Color(0xFFA094FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(imageUrl), // Replace with actual image URL
          ),
          const SizedBox(height: 10),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
