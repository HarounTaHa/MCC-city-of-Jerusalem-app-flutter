import 'package:flutter/material.dart';
import 'package:mcc_final_project/friends_chat.dart';
import 'package:mcc_final_project/utility/data_utils_chat_stream.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatStream extends StatefulWidget {
  @override
  _ChatStreamState createState() => _ChatStreamState();
}

class _ChatStreamState extends State<ChatStream> {
  StreamChatClient client;
  final _userNameController = TextEditingController();
  String _userNameError;
  bool _loading = false;
  bool _goChat = false;
  Future<void> _onGoChat() async {
    final userName = _userNameController.text;
    final user = client.state.user;
    if (user == null) {
      setState(() {
        _loading = true;
      });
      if (userName.isNotEmpty) {
        await client.connectUser(
          User(id: userName, extraData: {
            'image': DataUtils.getUserImage(userName),
          }),
          client.devToken(userName),
        );
        setState(() {
          _loading = false;
          _goChat = true;
        });
      } else {
        setState(() {
          _userNameError = 'user name is not valid';
        });
      }
    }
  }

  @override
  void initState() {
    client = StreamChatClient('94ur37awu44b', logLevel: Level.INFO);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return _goChat
            ? StreamChat(client: client, child: FriendsChat())
            : child;
      },
      home: Directionality(
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
                          Text(
                            'مرحباً بك في الدردشة ادخل اسمك بالغة الانجليزية',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          client.state.user == null
                              ? TextField(
                                  decoration: InputDecoration(
                                      hintText: 'اسمك...',
                                      errorText: _userNameError),
                                  controller: _userNameController,
                                )
                              : Text('User Name :${client.state.user.id}'),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: _onGoChat,
                            child: Text(
                              'هيا بنا',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
