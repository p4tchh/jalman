import 'package:flutter/material.dart';
import '/src/widgets/nav_items.dart';
import '/src/widgets/dropdown_widget.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  final void Function(String menu)? onMenuTap;

  const DashboardLayout({
    Key? key,
    required this.child,
    this.onMenuTap,
  }) : super(key: key);

  @override
  _DashboardLayoutState createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  bool _isNavOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main Layout
          Row(
            children: [
              // Side Navigation (Collapsible)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _isNavOpen ? 250 : 70,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Section: Burger Icon and Navigation Items
                    Expanded(
                      child: Column(
                        children: [
                          // Burger Icon
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            alignment: Alignment.center,
                            child: IconButton(
                              icon: Icon(
                                _isNavOpen ? Icons.menu_open : Icons.menu,
                                size: 28,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isNavOpen = !_isNavOpen;
                                });
                              },
                            ),
                          ),

                          // Navigation Items
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: [
                                  NavItem(
                                    icon: Icons.home,
                                    title: 'Home',
                                    isNavOpen: _isNavOpen,
                                    onTap: () {
                                      if (widget.onMenuTap != null) {
                                        widget.onMenuTap!("Home");
                                      }
                                    },
                                  ),
                                  NavItem(
                                    icon: Icons.work,
                                    title: 'Jobs',
                                    isNavOpen: _isNavOpen,
                                    onTap: () {
                                      if (widget.onMenuTap != null) {
                                        widget.onMenuTap!("Jobs");
                                      }
                                    },
                                  ),
                                  NavItem(
                                    icon: Icons.description,
                                    title: 'Forms',
                                    isNavOpen: _isNavOpen,
                                    onTap: () {
                                      if (widget.onMenuTap != null) {
                                        widget.onMenuTap!("Forms");
                                      }
                                    },
                                  ),
                                  NavItem(
                                    icon: Icons.calendar_today,
                                    title: 'Calendar',
                                    isNavOpen: _isNavOpen,
                                    onTap: () {
                                      if (widget.onMenuTap != null) {
                                        widget.onMenuTap!("Calendar");
                                      }
                                    },
                                  ),
                                  NavItem(
                                    icon: Icons.list,
                                    title: 'Lists',
                                    isNavOpen: _isNavOpen,
                                    onTap: () {
                                      if (widget.onMenuTap != null) {
                                        widget.onMenuTap!("Lists");
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Bottom Profile Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: _isNavOpen ? 30 : 20,
                            child: Icon(
                              Icons.person,
                              size: _isNavOpen ? 30 : 20,
                            ),
                          ),
                          if (_isNavOpen) ...[
                            const SizedBox(height: 8),
                            const Text(
                              "Your Name",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "your.email@example.com",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Main Content
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  child: widget.child,
                ),
              ),
            ],
          ),

          // Floating Top Right Section
          Positioned(
            top: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Notification Icon
                IconButton(
                  icon: const Icon(Icons.notifications, size: 28),
                  onPressed: () {
                    // Add notification logic here
                  },
                ),
                const SizedBox(width: 8),
                // Dropdown Widget
                const DropdownWidget(), // Use the dropdown widget
              ],
            ),
          ),
        ],
      ),
    );
  }
}


