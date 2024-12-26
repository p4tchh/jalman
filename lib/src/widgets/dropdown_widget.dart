import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({Key? key}) : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  final LayerLink _layerLink = LayerLink();
  bool _isDropdownOpen = false;

  OverlayEntry? _dropdownOverlay;

  @override
  void dispose() {
    _closeDropdown();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    final overlay = Overlay.of(context);
    _dropdownOverlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: 150,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0, 40),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMenuItem(Icons.person, "Profile", () {
                      _closeDropdown();
                      // Navigate to Profile
                    }),
                    const SizedBox(height: 8),
                    _buildMenuItem(Icons.settings, "Settings", () {
                      _closeDropdown();
                      // Navigate to Settings
                    }),
                    const SizedBox(height: 8),
                    _buildMenuItem(Icons.logout, "Logout", () {
                      _closeDropdown();
                      // Handle Logout
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    overlay?.insert(_dropdownOverlay!);
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _closeDropdown() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
    setState(() {
      _isDropdownOpen = false;
    });
  }

  Widget _buildMenuItem(IconData icon, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Row(
          children: const [
            Text(
              "Admin",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
