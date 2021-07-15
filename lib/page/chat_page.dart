import 'dart:io';

import 'package:chat_flutter/widgets/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  List<ChatMessage> _message = [];
  bool writting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Column(
          children: [
            CircleAvatar(
              child: Text(
                "MF",
                style: TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.blueAccent,
              maxRadius: 15,
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Melissa Flores",
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _message.length,
              itemBuilder: (_, i) => _message[i],
              reverse: true,
            )),
            Divider(
              height: 5,
            ),
            Container(
              height: 50,
              color: Colors.white,
              child: _inputCaja(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputCaja() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted: (_) {},
            onChanged: (texto) {
              setState(() {
                if (texto.trim().length > 0) {
                  writting = true;
                } else {
                  writting = false;
                }
              });
            },
            decoration: InputDecoration.collapsed(hintText: "Enviar Mensaje"),
            focusNode: _focusNode,
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Platform.isIOS
                ? CupertinoButton(child: Text("Enviar"), onPressed: () {})
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(
                          Icons.send,
                        ),
                        onPressed: writting
                            ? () => _handleSummmit(_textController.text)
                            : null,
                      ),
                    ),
                  ),
          )
        ],
      ),
    ));
  }

  _handleSummmit(String texto) {
    if (texto.length == 0) return;
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();
    final newMessage = ChatMessage(
        uid: "123",
        texto: texto,
        animationController: AnimationController(
            vsync: this, duration: Duration(milliseconds: 200)));
    _message.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      writting = false;
    });
  }

  @override
  void dispose() {
    //off del socket
    for (ChatMessage message in _message) {
      message.animationController.dispose();
    }
    // TODO: implement dispose
    super.dispose();
  }
}
