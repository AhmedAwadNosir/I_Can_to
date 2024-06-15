import 'package:flutter/material.dart';
import 'package:ican_to/core/functions/sending_email.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/features/aboutUs/views/about_developers_view.dart';
import 'package:ican_to/features/aboutUs/views/about_program_view.dart';

class AboutUsViewBody extends StatefulWidget {
  const AboutUsViewBody({
    super.key,
  });

  @override
  State<AboutUsViewBody> createState() => _AboutUsViewBodyState();
}

class _AboutUsViewBodyState extends State<AboutUsViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _translationAnimation;

  int counter = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: false);

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.141592653589793,
    ).animate(_controller);
    _translationAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(_controller);
  }

  void _stopAnimation() {
    if (_controller.isAnimating) {
      setState(() {
        counter++;
      });
      _controller.stop();
    } else {
      _controller.repeat(reverse: false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Image(image: AssetImage(AppImages.homeAppLogo)),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.terminal_rounded),
                title: const Text('About Program'),
                subtitle: const Text('What Is This Program ?'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pushNamed(context, AboutProgramView.id);
                },
              ),
              ListTile(
                leading: const Icon(Icons.developer_mode),
                title: const Text('About Developers'),
                subtitle: const Text('Who we Are ?'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pushNamed(context, AboutDevelopersView.id);
                },
              ),
              const ListTile(
                leading: Icon(Icons.alternate_email),
                title: Text('Contact Us'),
                subtitle: Text('How To Reach Developers ?'),
                trailing: Icon(Icons.arrow_forward),
                onTap: sendingEmailToDevTeam,
              ),
            ],
          ),
        ),
        const Text(
          "How Many Times U Can Catch Dash ?",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          counter.toString(),
          style: const TextStyle(fontSize: 18, color: Color(0xff3CC563)),
        ),
        const SizedBox(
          height: 30,
        ),
        AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? childe) {
              return Transform.translate(
                offset: _translationAnimation.value *
                    (MediaQuery.of(context).size.width),
                child: Transform.rotate(
                  angle: _rotationAnimation.value * 3,
                  child: InkWell(
                    onTap: _stopAnimation,
                    child: const Icon(
                      Icons.flutter_dash_outlined,
                      size: 70,
                      color: Color(0xff3CC563),
                    ),
                  ),
                ),
              );
            }),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
