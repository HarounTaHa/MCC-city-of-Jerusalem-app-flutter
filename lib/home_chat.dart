import 'package:flutter/material.dart';
import 'package:mcc_final_project/utility/data_utils_chat_stream.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'friends_chat.dart';

class HomeChat extends StatefulWidget {
  @override
  _HomeChatState createState() => _HomeChatState();
}

class _HomeChatState extends State<HomeChat> {
  final _userNameController = TextEditingController();
  String _userNameError;
  bool _loading = false;
  Future<void> _onGoPressed() async {
    final userName = _userNameController.text;

    if (userName.isNotEmpty) {
      final client = StreamChat.of(context).client;
      final user = client.state.user;
      if (user == null) {
        setState(() {
          _loading = true;
        });
        await client.connectUser(
          User(id: userName, extraData: {
            'image': DataUtils.getUserImage(userName),
          }),
          client.devToken(userName),
        );
        setState(() {
          _loading = false;
        });
      }
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FriendsChat()));
    } else {
      setState(() {
        _userNameError = 'user name is not valid';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final client = StreamChat.of(context).client;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: _loading
              ? CircularProgressIndicator()
              : Card(
                  elevation: 11,
                  margin: const EdgeInsets.all(15.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Welcome to the publicChat'),
                        if (client.state.user == null)
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'User Name',
                                errorText: _userNameError),
                            controller: _userNameController,
                          )
                        else
                          Text('User Name :${client.state.user.id}'),
                        ElevatedButton(
                          onPressed: _onGoPressed,
                          child: Text('Go'),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
