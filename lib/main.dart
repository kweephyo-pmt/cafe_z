import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loading_screen.dart';
import 'models/coffee_shop.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CoffeeShop(),  
      child: MaterialApp(
        title: 'Cafe Z',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: LoadingScreen(),
        debugShowCheckedModeBanner: false, // Set this to false to remove the debug banner
      ),
    );
  }
}
