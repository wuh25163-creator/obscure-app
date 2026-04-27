import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class ChatRoomScreen extends StatefulWidget {
  final String contactName;
  final String contactStatus;

  const ChatRoomScreen({
    super.key,
    this.contactName = '設計師',
    this.contactStatus = '在線',
  });

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: Stack(
                children: [
                  _buildBackgroundDecorations(),
                  ListView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                    children: [
                      _buildDateHeader('今天'),
                      const SizedBox(height: 16),
                      _buildReceivedMessage(
                        message: "嘿！我一直在審閱春季號的最新編輯版面。你覺得專題故事的非對稱網格如何？",
                        time: "09:41 AM",
                      ),
                      const SizedBox(height: 16),
                      _buildSentMessage(
                        message: "我很喜歡。它比之前的結構感覺高階許多。留白確實讓照片有了喘息的空間。",
                        time: "09:43 AM",
                        isRead: true,
                      ),
                      const SizedBox(height: 16),
                      _buildReceivedMessageWithImage(
                        message: "這是我想要的氛圍。非常「空靈編輯感」。",
                        time: "09:45 AM",
                      ),
                      const SizedBox(height: 16),
                      _buildSentMessageBrief(
                        message: "完美。讓我們朝這個方向繼續前進。 ✨",
                        time: "09:46 AM",
                      ),
                      const SizedBox(height: 16),
                      _buildTypingIndicator(),
                    ],
                  ),
                ],
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        border: Border(bottom: BorderSide(color: AppTheme.primary, width: 2)),
        boxShadow: [BoxShadow(color: AppTheme.primary, offset: Offset(0, 2))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.transparent, width: 2),
                  ),
                  child: const Icon(Icons.arrow_back, color: AppTheme.primary, size: 24),
                ),
              ),
              const SizedBox(width: 4),
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.primary, width: 2),
                          color: Colors.grey[300],
                        ),
                        child: const Icon(Icons.person, color: Colors.white, size: 24),
                      ),
                      Positioned(
                        bottom: -2,
                        right: -2,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            border: Border.all(color: AppTheme.primary, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         widget.contactName.toUpperCase(),
                         style: const TextStyle(
                           fontFamily: 'Space Grotesk',
                           fontWeight: FontWeight.w900,
                           fontSize: 16,
                           letterSpacing: 0,
                           height: 1.1,
                         ),
                       ),
                       const SizedBox(height: 2),
                       Text(
                         widget.contactStatus.toUpperCase(),
                         style: TextStyle(
                           fontFamily: 'Space Grotesk',
                           fontWeight: FontWeight.bold,
                           fontSize: 11,
                           letterSpacing: 1.0,
                           color: AppTheme.primary.withValues(alpha: 0.6),
                         ),
                       ),
                     ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.videocam, color: AppTheme.primary, size: 24),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: AppTheme.primary, size: 24),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateHeader(String text) {
    return Center(
      child: Transform.rotate(
        angle: -0.05,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.primary,
            border: Border.all(color: AppTheme.primary, width: 2),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.white,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReceivedMessage({required String message, required String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.8),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primary, width: 2),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))],
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    letterSpacing: 0,
                  ),
                ),
              ),
            );
          }
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            time,
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.bold,
              fontSize: 11,
              letterSpacing: 1.0,
              color: AppTheme.primary.withValues(alpha: 0.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSentMessage({required String message, required String time, bool isRead = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.8),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200], // primary-container
                  border: Border.all(color: AppTheme.primary, width: 2),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))],
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                    letterSpacing: 0,
                  ),
                ),
              ),
            );
          }
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  letterSpacing: 1.0,
                  color: AppTheme.primary.withValues(alpha: 0.5),
                ),
              ),
              if (isRead) ...[
                const SizedBox(width: 4),
                const Icon(Icons.done_all, size: 14, color: AppTheme.accentBlue),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReceivedMessageWithImage({required String message, required String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.8),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primary, width: 2),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: constraints.maxWidth * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: AppTheme.primary, width: 2),
                      ),
                      child: const Center(
                        child: Icon(Icons.image, size: 36, color: Colors.grey),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        border: Border(top: BorderSide(color: AppTheme.primary, width: 2)),
                      ),
                      child: Text(
                        message,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            time,
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.bold,
              fontSize: 11,
              letterSpacing: 1.0,
              color: AppTheme.primary.withValues(alpha: 0.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSentMessageBrief({required String message, required String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppTheme.accentBlue, // tertiary
                  border: Border.all(color: AppTheme.primary, width: 2),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))],
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontFamily: 'Space Grotesk',
                    fontSize: 14,
                    color: Colors.white,
                    letterSpacing: 0,
                  ),
                ),
              ),
            );
          }
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Text(
            time,
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.bold,
              fontSize: 11,
              letterSpacing: 1.0,
              color: AppTheme.primary.withValues(alpha: 0.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTypingIndicator() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.accentYellow,
            border: Border.all(color: AppTheme.primary, width: 2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDot(0),
              const SizedBox(width: 4),
              _buildDot(150),
              const SizedBox(width: 4),
              _buildDot(300),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "${widget.contactName.split(' ')[0].toUpperCase()} 正在輸入",
          style: const TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.w900,
            fontSize: 11,
            letterSpacing: 1.0,
            color: AppTheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildDot(int delayMillis) {
    return Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle, 
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        border: Border(top: BorderSide(color: AppTheme.primary, width: 2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppTheme.primary, width: 2),
              boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))],
            ),
            child: IconButton(
              icon: const Icon(Icons.add, size: 24, color: AppTheme.primary),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppTheme.primary, width: 2),
                boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppTheme.primary,
                      ),
                      maxLines: 4,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: '輸入訊息...',
                        hintStyle: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 1.0,
                          color: AppTheme.primary.withValues(alpha: 0.4),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.mood, color: AppTheme.primary, size: 20),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppTheme.primary,
              border: Border.all(color: AppTheme.primary, width: 2),
              boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))],
            ),
            child: IconButton(
              icon: const Icon(Icons.send, size: 20, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundDecorations() {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.1,
        child: Stack(
          children: [
            Positioned(
              top: 100,
              left: 20,
              child: Transform.rotate(
                angle: 0.2,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: AppTheme.primary, width: 2),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              right: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: AppTheme.accentYellow,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.primary, width: 2),
                ),
              ),
            ),
            Positioned(
              top: 300,
              right: 50,
              child: Transform.rotate(
                angle: -0.5,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppTheme.accentBlue,
                    border: Border.all(color: AppTheme.primary, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
