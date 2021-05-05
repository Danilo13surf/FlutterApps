import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);

  final Function({String text, File imgFile}) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

TextEditingController _controller = TextEditingController();

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;

  void _reset() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () async {
                final File imgFile =
                    await ImagePicker.pickImage(source: ImageSource.camera);
                if (imgFile == null) return;
                widget.sendMessage(imgFile: imgFile);
              }),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration:
                  InputDecoration.collapsed(hintText: "Enviar Mensagem"),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.sendMessage(text: text);
                _reset();
              },
            ),
          ),
          IconButton(
              icon: Icon(Icons.send),
              color: Colors.orange,
              onPressed: _isComposing
                  ? () {
                      widget.sendMessage(text: _controller.text);
                      _reset();
                    }
                  : null)
        ],
      ),
    );
  }
}
