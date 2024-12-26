import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Responsive Metrics Section
          LayoutBuilder(
            builder: (context, constraints) {
              // Calculate dynamic width for cards based on screen size
              final double cardWidth =
                  (constraints.maxWidth - (4 * 16)) / 5; // 4 spaces of 16 between cards

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildMetricCard(
                      icon: Icons.people,
                      label: "Employees",
                      value: 250,
                      color: Colors.green,
                      width: cardWidth,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmployeesPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildMetricCard(
                      icon: Icons.how_to_reg,
                      label: "Applicants",
                      value: 120,
                      color: Colors.orange,
                      width: cardWidth,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ApplicantsPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildMetricCard(
                      icon: Icons.timer,
                      label: "Pending",
                      value: 25,
                      color: Colors.red,
                      width: cardWidth,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PendingPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildMetricCard(
                      icon: Icons.business,
                      label: "Departments",
                      value: 20,
                      color: Colors.purple,
                      width: cardWidth,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DepartmentsPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildMetricCard(
                      icon: Icons.interpreter_mode,
                      label: "Interviews",
                      value: 150,
                      color: Colors.teal,
                      width: cardWidth,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InterviewsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 32),

          // Chart Section
          _buildGraphCard(),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required IconData icon,
    required String label,
    required int value,
    required Color color,
    required double width,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap, // Make the card clickable
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 8),
            Text(
              "$value",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGraphCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hires per month',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 400,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey[200],
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 20,
                      reservedSize: 40,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const months = [
                          'Jan',
                          'Feb',
                          'Mar',
                          'Apr',
                          'May',
                          'Jun',
                          'Jul',
                          'Aug',
                          'Sep',
                          'Oct',
                          'Nov',
                          'Dec'
                        ];
                        if (value.toInt() < months.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              months[value.toInt()],
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 10),
                      FlSpot(1, 25),
                      FlSpot(2, 45),
                      FlSpot(3, 30),
                      FlSpot(4, 60),
                      FlSpot(5, 20),
                      FlSpot(6, 35),
                      FlSpot(7, 40),
                      FlSpot(8, 35),
                      FlSpot(9, 35),
                      FlSpot(10, 40),
                      FlSpot(11, 45),
                    ],
                    isCurved: true,
                    color: const Color(0xFF358873),
                    barWidth: 2,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: const Color(0xFF358873).withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder Pages
class EmployeesPage extends StatelessWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Employees")),
      body: const Center(child: Text("Employees Page")),
    );
  }
}

class ApplicantsPage extends StatelessWidget {
  const ApplicantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Applicants")),
      body: const Center(child: Text("Applicants Page")),
    );
  }
}

class PendingPage extends StatelessWidget {
  const PendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pending")),
      body: const Center(child: Text("Pending Page")),
    );
  }
}

class DepartmentsPage extends StatelessWidget {
  const DepartmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Departments")),
      body: const Center(child: Text("Departments Page")),
    );
  }
}

class InterviewsPage extends StatelessWidget {
  const InterviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Interviews")),
      body: const Center(child: Text("Interviews Page")),
    );
  }
}





