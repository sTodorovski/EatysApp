import 'package:eatys/pages/HomePage.dart';
import 'package:eatys/pages/MapPage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../Animations/FadeAnimation.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _textVisible = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    _animation = Tween<double>(
      begin: 1.0,
      end: 25.0,
    ).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then((f) => Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: HomePage())));
  }

  void _onMap() {
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then((f) => Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: MapPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/start.jpg'), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.8),
          Colors.black.withOpacity(.2),
        ])),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FadeAnimation(
                  .5,
                  Text(
                    "Welcome to Eaty's!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 100,
              ),
              FadeAnimation(
                  1,
                  Text(
                    "Click 'start' to continue to the app or click 'view map' to view nearby restaurants",
                    style: TextStyle(
                        color: Colors.white, height: 1.4, fontSize: 18),
                  )),
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                1.2,
                ScaleTransition(
                    scale: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.orange])),
                      child: AnimatedOpacity(
                        opacity: _textVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 50),
                        child: MaterialButton(
                            minWidth: double.infinity,
                            child: Text(
                              "Start",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => _onTap()),
                      ),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                1.2,
                ScaleTransition(
                    scale: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.orange])),
                      child: AnimatedOpacity(
                        opacity: _textVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 50),
                        child: MaterialButton(
                            minWidth: double.infinity,
                            child: Text(
                              "View Map",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => _onMap()),
                      ),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                  1.4,
                  AnimatedOpacity(
                    opacity: _textVisible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 50),
                    child: Align(
                      child: Text(
                        "Free delivery on all orders!",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
