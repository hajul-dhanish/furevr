import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furevr/firebase/cloud_firestore.dart';
import 'package:furevr/firebase/services.dart';
import 'package:furevr/repository/services_repo/grooming_repo.dart';
import 'package:furevr/view_model/services_vm/grooming_vm.dart';

class TextTT extends StatelessWidget {
  const TextTT({super.key});

  @override
  Widget build(BuildContext context) {
    GroomingServiceViewModel().getGroomingServices();
    return Text("data");
    // return Material(
    //   child: FutureBuilder<QuerySnapshot>(
    //     future: getData(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(child: CircularProgressIndicator());
    //       }

    //       if (!snapshot.hasData) {
    //         return const Center(child: Text('No data found.'));
    //       }

    //       final users = snapshot.data!.docs;

    //       return ListView.builder(
    //         itemCount: users.length,
    //         itemBuilder: (context, index) {
    //           var userData = users[index].data() as Map<String, dynamic>;
    //           return ListTile(
    //             title: Text(userData['name'] ?? 'No Name'),
    //             subtitle: Text(userData['email'] ?? 'No Email'),
    //           );
    //         },
    //       );
    //     },
    //   ),
    // );
  }
}
