import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cryptocode_app/layouts/appbar.dart';

class CriptoPage extends StatefulWidget {
  const CriptoPage({super.key});

  @override
  State<CriptoPage> createState() => _CriptoPageState();
}

class _CriptoPageState extends State<CriptoPage> {
  final user = FirebaseAuth.instance.currentUser!;

  // Document IDs
  List<String> docIDs = [];

  // Get docIDs
  Future getDocID() async {
  try {
    await FirebaseFirestore.instance.collection('users').get().then(
      (snapshot) => snapshot.docs.forEach((document) {
        print(document.reference);
        docIDs.add(document.reference.id);
      })
    );
  } on FirebaseAuthException catch (e) {
    print(e);
  }
  }

  @override
  void initState() {
    getDocID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Home Page'),
      body: Center(
        child: Text(
          'Home Page'
        ),
      ),
    );
  }
}