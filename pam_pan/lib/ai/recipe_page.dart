import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  late GenerativeModel _model;
  late Channel channel;

  @override
  void initState() {
    super.initState();
    channel = StreamChat.of(context).client.channel(
          'messaging',
          id: 'flutter_text_ai_gen_1',
        )..watch();

    _model = FirebaseVertexAI.instance.generativeModel(
      model: 'gemini-1.5-flash-preview-0514',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Generation'),
      ),
      body: StreamChannel(
        channel: channel,
        child: _ChannelPage(
          onMessageSent: _generate,
        ),
      ),
    );
  }

  void _generate(Message message) async {
    String prompt = message.text!;
    if (prompt.isEmpty) return;

    final content = [Content.text(prompt)];

    final response = await _model.generateContent(content);
    channel.sendMessage(
      Message(
        text: response.text,
        extraData: const {
          'isGeminiMessage': true,
        },
      ),
    );
  }
}

/// Displays the list of messages inside the channel
class _ChannelPage extends StatelessWidget {
  final ValueChanged<Message> onMessageSent;

  const _ChannelPage({
    super.key,
    required this.onMessageSent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StreamChannelHeader(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamMessageListView(
              messageBuilder: (context, details, list, def) {
                return def.copyWith(
                  reverse:
                      !(details.message.extraData['isGeminiMessage'] as bool? ??
                          false),
                  borderRadiusGeometry: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  showUsername: false,
                  showSendingIndicator: false,
                  showTimestamp: false,
                );
              },
            ),
          ),
          StreamMessageInput(
            onMessageSent: onMessageSent,
            showCommandsButton: false,
            disableAttachments: true,
          ),
        ],
      ),
    );
  }
}
