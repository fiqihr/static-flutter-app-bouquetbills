import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_app/resources/color.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Message {
  final String text;
  final String time;

  Message(this.text, this.time);
}

class MessageProvider extends ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  void addMessage(String text, String time) {
    _messages.insert(0, Message(text, time));
    notifyListeners();
  }
}

class chatPage extends StatelessWidget {
  // singleton untuk MessageProvider
  static final MessageProvider messageProvider = MessageProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: messageProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ChatScreen(),
        ),
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(BuildContext context) {
    final messageProvider =
        Provider.of<MessageProvider>(context, listen: false);
    if (_textController.text.isNotEmpty) {
      DateTime now = DateTime.now();
      String formattedTime = DateFormat.Hm().format(now);
      messageProvider.addMessage(_textController.text, formattedTime);
      _textController.clear();
    }
  }

  Widget _buildMessageList(BuildContext context) {
    final messageProvider = Provider.of<MessageProvider>(context);

    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: messageProvider.messages.length,
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          messageProvider.messages[index].text,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                            height: 4.0), // Added spacing for better visibility
                        Text(
                          messageProvider.messages[index].time,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 5,
          top: 5,
          bottom: 5,
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: (_) => _handleSubmitted(context),
                decoration: InputDecoration.collapsed(
                  hintText: 'Tuliskan pesan...',
                ),
              ),
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.send_rounded,
                  color: secondaryColor,
                ),
                onPressed: () => _handleSubmitted(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: Text(
          'Chat Penjual',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          _buildMessageList(context),
          Divider(height: 1.0),
          _buildTextComposer(context),
        ],
      ),
    );
  }
}
