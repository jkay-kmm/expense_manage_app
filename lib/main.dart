import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manage_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void>main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true
  );
  runApp(const MyApp());
}

