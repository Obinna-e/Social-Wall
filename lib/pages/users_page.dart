import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_wall/components/my_back_button.dart';
import 'package:social_wall/components/my_list_tile.dart';
import 'package:social_wall/helper/helper_functions.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Users').snapshots(),
          builder: (context, snapshot) {
            // any errors

            if (snapshot.hasError) {
              displayMessageToUser("Something went wrong", context);
            }

            // show loading circle
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == null) {
              return const Text("No Data");
            }
            // get all users
            final users = snapshot.data!.docs;

            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 50.0,
                    left: 25,
                  ),
                  child: Row(
                    children: [
                      MyBackButton(),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        //get individual users
                        final user = users[index];

                        return MyListTile(
                          title: user['username'],
                          subTitle: user['email'],
                        );
                      }),
                ),
              ],
            );
          }),
    );
  }
}
