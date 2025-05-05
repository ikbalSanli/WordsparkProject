import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final Gemini gemini = Gemini.instance;
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController _listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  final Color primaryColor = const Color(0xFF7E57C2); // Ana mor renk
  final Color secondaryColor = const Color(0xFF5E35B1); // Koyu mor
  final Color accentColor = const Color(0xFFB39DDB); // Açık mor
  final Color backgroundColor = const Color(0xFFF5F5F7); // Hafif gri arka plan
  final Color textPrimaryColor = const Color(0xFF424242); // Koyu metin rengi
  final Color textSecondaryColor = const Color(0xFF757575); // Orta metin rengi

  final List<Map<String, dynamic>> messages = [];
  bool isLoading = false;
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
    // Uygulama başlangıcında hoş geldin mesajı göster
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addWelcomeMessage();
    });
  }

  void _addWelcomeMessage() {
    setState(() {
      messages.add({
        "role": "bot",
        "text": "Hi! Welcome to the WordSpark!",
        "timestamp": DateTime.now()
      });
    });
  }

  void sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final sentTime = DateTime.now();

    setState(() {
      messages.add({
        "role": "user",
        "text": text,
        "timestamp": sentTime
      });
      isLoading = true;
      isTyping = true;
      textEditingController.clear();
    });

    _scrollToBottom();

    // Typing indicator göster
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final response = await gemini.text(text);

      setState(() {
        messages.add({
          "role": "bot",
          "text": response?.output ?? "Üzgünüm, bir hata oluştu. Lütfen tekrar deneyin.",
          "timestamp": DateTime.now()
        });
      });
    } catch (e) {
      setState(() {
        messages.add({
          "role": "bot",
          "text": "Bağlantı hatası oluştu. Lütfen internet bağlantınızı kontrol edin ve tekrar deneyin.",
          "timestamp": DateTime.now()
        });
      });
    } finally {
      setState(() {
        isLoading = false;
        isTyping = false;
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_listScrollController.hasClients) {
        _listScrollController.animateTo(
          _listScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _getTimeString(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  Widget _buildUserAvatar() {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: secondaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Center(
        child: Icon(
          Icons.bolt,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildBotAvatar() {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: primaryColor.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.smart_toy_rounded,
          color: primaryColor,
          size: 20,
        ),
      ),
    );
  }

  Widget buildMessage(Map<String, dynamic> msg) {
    final bool isUser = msg['role'] == 'user';
    final DateTime timestamp = msg['timestamp'] ?? DateTime.now();

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) _buildBotAvatar(),
          if (!isUser) const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isUser ? primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(20).copyWith(
                      bottomRight: isUser ? const Radius.circular(4) : null,
                      bottomLeft: !isUser ? const Radius.circular(4) : null,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Text(
                    msg['text'],
                    style: TextStyle(
                      color: isUser ? Colors.white : textPrimaryColor,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _getTimeString(timestamp),
                  style: TextStyle(
                    color: textSecondaryColor.withOpacity(0.6),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          if (isUser) const SizedBox(width: 10),
          if (isUser) _buildUserAvatar(),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildBotAvatar(),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20).copyWith(
                bottomLeft: const Radius.circular(4),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SpinKitThreeBounce(
              color: primaryColor,
              size: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyChat() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.chat_rounded,
              size: 64,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "WordSpark Chat",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Dil pratiği yapmak için bir şeyler yazın ve sohbete başlayın!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: textSecondaryColor,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          "WordSpark Chat",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        actions: [

        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.05),
                border: Border(
                  bottom: BorderSide(
                    color: primaryColor.withOpacity(0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 18,
                    color: primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "WordSpark ile istediğiniz dilde pratik yapabilirsiniz.",
                      style: TextStyle(
                        fontSize: 13,
                        color: textSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: messages.isEmpty
                  ? _buildEmptyChat()
                  : ListView.builder(
                controller: _listScrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                itemCount: messages.length + (isTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == messages.length && isTyping) {
                    return _buildTypingIndicator();
                  }
                  return buildMessage(messages[index]);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, -2),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: primaryColor.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        maxLines: null,
                        textCapitalization: TextCapitalization.sentences,
                        style: TextStyle(
                          fontSize: 16,
                          color: textPrimaryColor,
                        ),
                        decoration: InputDecoration(
                          hintText: "Mesajınızı yazın...",
                          hintStyle: TextStyle(
                            color: textSecondaryColor.withOpacity(0.6),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onSubmitted: sendMessage,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                      gradient: LinearGradient(
                        colors: [primaryColor, secondaryColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        isLoading ? Icons.hourglass_empty : Icons.send_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                      onPressed: isLoading
                          ? null
                          : () => sendMessage(textEditingController.text),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}