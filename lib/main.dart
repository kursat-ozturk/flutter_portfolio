import 'package:flutter/material.dart';

import 'widgets/personal_portfolio.dart';

void main() {
  runApp(const PersonalPortfolioApp());
}

class PersonalPortfolioApp extends StatelessWidget {
  const PersonalPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: PersonalPortfolio(),
        ),
      ),
    );
  }
}
