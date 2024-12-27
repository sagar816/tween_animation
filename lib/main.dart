import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  late Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 4)); //call this class  // can change time to change speed
    // animation = Tween(begin: 0.0, end: 200.0)   // values should always be in double
    // animation = Tween(begin: 200.0, end: 0.0) // values should always be in double
    animation = Tween(
            begin: 200.0, end: 100.0) // values should always be in double
        .animate(animationController); // positonal arguments - curly brackets

    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.orange)
        .animate(animationController);  //for color hexcode = colortween

    animationController.addListener(() {
      print(animation.value);
      setState(() {
        //to reflect in UI
      });
    });

    animationController.forward(); //to start the animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tween"),
      ),
      body: Center(
          child: Container(
        width: animation.value,
        height: animation.value,
        color: colorAnimation.value,
      )),
    );
  }
}
