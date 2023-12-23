import 'package:flutter/material.dart';

class BusinessCardWidget extends StatelessWidget {
  const BusinessCardWidget({
    Key? key,
    required this.name,
    required this.jobTitle,
    required this.company,
    required this.email,
    required this.phone,
    required this.profileImage,
  }) : super(key: key);

  final String name;
  final String jobTitle;
  final String company;
  final String email;
  final String phone;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   width: double.infinity,
            //   child: Image.network(
            //     profileImage,
            //     fit: BoxFit.cover,
            //     height: 150,
            //   ),
            // ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              jobTitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              company,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.email),
                const SizedBox(width: 8),
                Text(email),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.phone),
                const SizedBox(width: 8),
                Text(phone),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
