import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class FriendsChat extends StatefulWidget {
  @override
  _FriendsChatState createState() => _FriendsChatState();
}

class _FriendsChatState extends State<FriendsChat> {
  @override
  Widget build(BuildContext context) {
    final client = StreamChat.of(context).client;
    final channel =
        client.channel('messaging', id: 'jerusalemRoom', extraData: {
      'name': "Jerusalem Chat",
      "image":
          "https://jerusalemexpatnetwork.files.wordpress.com/2017/12/cropped-jerusalem_dome_of_the_rock_bw_14.jpg"
    });
    channel.watch();
    return Scaffold(
      body: StreamChannel(
        channel: channel,
        child: ChannelPage(),
      ),
    );
  }
}

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: ChannelHeader(),
      body: Column(
        children: [
          Expanded(
            child: MessageListView(),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}
