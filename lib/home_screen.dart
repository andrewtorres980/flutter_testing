import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_testing/auth_service.dart';
import 'package:flutter_testing/chat_room_screen.dart';
import 'package:get/get.dart';

import 'chat_screen.dart';

class UserListScreen extends StatelessWidget {
  // Reference to the Firestore instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    String? currentUserId = _auth.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(ChatRoomScreen());
              },
              icon: const Icon(Icons.chat_rounded)),
          IconButton(
              onPressed: () {
                AuthService().signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('chatrooms').where('userIds', arrayContains: currentUserId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: const CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No users found.'));
          }
          List<DocumentSnapshot> docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              // Get the data of each document
              Map<String, dynamic> userData =
                  docs[index].data() as Map<String, dynamic>;
              print(userData['userIds'][1]);
              // Display the user's name and email
              return Card(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  title: Text(
                    userData['name'] ?? 'No Name',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                  subtitle: Text(userData['lastMessage']['content'] ?? 'No Content'),
                  onTap: () {
                    // Get the current user ID (assume using FirebaseAuth)
                    String currentUserId =
                        FirebaseAuth.instance.currentUser!.uid;

                    // Get the selected user's ID
                    String selectedUserId = userData[
                        'userIds'][1]; // Make sure the 'userId' field is in the Firestore document

                    // Create the chatroom ID
                    String chatroomId =
                        createChatroomId(currentUserId, selectedUserId);

                    // Navigate to the chat screen, passing the chatroom ID and selected user's data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          chatroomId: chatroomId,
                          selectedUser: userData,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  String createChatroomId(String userId1, String userId2) {
    // Create a list with both user IDs
    List<String> userIds = [userId1, userId2];

    // Sort the user IDs alphabetically
    userIds.sort();

    // Combine the sorted user IDs with an underscore to create the chatroomId
    return '${userIds[0]}_${userIds[1]}';
  }
}
