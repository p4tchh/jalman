import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isNavOpen; // Indicates if the nav is open or collapsed

  const NavItem({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isNavOpen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20), // Align icons consistently
            Icon(icon, size: 24),
            if (isNavOpen) ...[
              const SizedBox(width: 16),
              Expanded( // Ensure text does not overflow
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis, // Handle long text
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}




