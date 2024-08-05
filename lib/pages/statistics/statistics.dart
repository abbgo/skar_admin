import 'package:flutter/material.dart';
import 'package:skar_admin/pages/statistics/parts/product_complaints_button.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        children: const [
          ProductComplaintsButton(),
        ],
      ),
    );
  }
}
