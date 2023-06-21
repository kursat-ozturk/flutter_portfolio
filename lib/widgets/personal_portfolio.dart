import 'package:flutter/material.dart';

class PersonalPortfolio extends StatefulWidget {
  const PersonalPortfolio({super.key});

  @override
  State<PersonalPortfolio> createState() => _PersonalPortfolioState();
}

class _PersonalPortfolioState extends State<PersonalPortfolio>
    with TickerProviderStateMixin {
  late AnimationController ctrl;
  late AnimationController contentCtrl;
  final Color appColor = Colors.blueAccent;
  final String avatarImg =
      'https://lh3.googleusercontent.com/a/AAcHTtcrn5bCmAS4AUDYPRC8Q57_y3fU6XvfbMB7vyj-QRU=s288-c-no';

  @override
  void initState() {
    super.initState();
    ctrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    contentCtrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();
  }

  @override
  void dispose() {
    ctrl.dispose();
    contentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: contentCtrl, curve: Curves.easeInOut)),
      child: SlideTransition(
        position: Tween<Offset>(
                begin: const Offset(0.0, 0.125), end: Offset.zero)
            .animate(
                CurvedAnimation(parent: contentCtrl, curve: Curves.easeInOut)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  //the avatar circle
                  FadeTransition(
                    opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                        CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)),
                    child: ScaleTransition(
                      scale: Tween<double>(begin: 1.0, end: 1.5).animate(
                          CurvedAnimation(
                              parent: ctrl, curve: Curves.easeInOut)),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  // the avatar image container
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: NetworkImage(avatarImg),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: appColor,
                        width: 8,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Kürşat Öztürk',
                style: TextStyle(
                  color: appColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Software Developer'),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.email, color: appColor),
                    const SizedBox(width: 10),
                    Text(
                      'ozturk-kursat@outlook.com',
                      style: TextStyle(color: appColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.language, color: Colors.blueAccent),
                    SizedBox(width: 10),
                    Text(
                      'https://github.com/kursat-ozturk',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
