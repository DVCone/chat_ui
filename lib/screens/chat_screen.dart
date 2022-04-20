import 'package:chatui/models/message_model.dart';
import 'package:chatui/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // chat message section
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          // current user margin
          ? const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          // user chat margin
          : const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: isMe
          // current user message box style
          ? BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0)),
            )
          // userchat message box style
          : const BoxDecoration(
              color: Color(0xFFFFEFEE),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)),
            ),
      // Chat message section
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // time section
          Text(
            message.time!,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5.0),
          // message text section
          Text(
            message.text!,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }

    // favorite message section
    return Row(
      children: [
        msg,
        IconButton(
          onPressed: () {},
          icon: message.isLiked!
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: message.isLiked!
              ? Theme.of(context).colorScheme.primary
              : Colors.blueGrey,
        ),
      ],
    );
  }

  // Typing Section
  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: [
          // Upload Photo Section
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          // TextField Section
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          // Send Section
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      // AppBar
      appBar: AppBar(
        // Center title
        centerTitle: true,
        title: Text(
          widget.user!.name!,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        // more menu icon
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
          ),
        ],
      ),
      // body section
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                // background box decoration
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: ListView.builder(
                      // chat message style
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      padding: const EdgeInsets.only(top: 15.0),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        final bool isMe =
                            message.sender!.id! == currentUser.id!;
                        // chat message section
                        return _buildMessage(message, isMe);
                      }),
                ),
              ),
            ),

            // Typing Section
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
