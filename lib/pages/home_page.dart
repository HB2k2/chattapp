import 'package:chattapp/pages/chat_page.dart';
import 'package:chattapp/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // signout user
  void signOut() {
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Chats"),
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: _buildUserList(),
          ),
        ],
      ),
    );
  }

  // build a list of users except of current logged in user
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading ..');
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs
              .map<Widget>((doc) =>
                  _buildUserListItem(doc, snapshot.data!.docs.indexOf(doc)))
              .toList(),
        );
      },
    );
  }

  // build individual user list items
  Widget _buildUserListItem(DocumentSnapshot document, int index) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // display all users except current user
    if (_auth.currentUser!.email != data['email']) {
      return Column(
        children: [
          ListTile(
            tileColor: Colors.grey[300],
            leading: Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.grey[600],
            ),
            title: Text(
              data['email'],
              style: const TextStyle(color: Colors.black87),
            ),
            onTap: () {
              // pass the clicked user's UID to the chat Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverUserEmail: data['email'],
                    receiverUserID: data['uid'],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 2),
        ],
      );
    } else {
      return Container();
    }
  }
}
