import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade400,
          elevation: 0,
          iconTheme: const IconThemeData(color: Color(0xFFE65100)),
          title: const Text(
            'Messages',
            style: TextStyle(
              color: Color(0xFFE65100),
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Color(0xFFE65100),
            labelColor: Color(0xFFE65100),
            unselectedLabelColor: Colors.white,
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'Chats'),
              Tab(text: 'Groups'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildChatList(),
            _buildGroupList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey.shade400,
          onPressed: () => _showNewChatMenu(context),
          child: const Icon(Icons.add, color: Color(0xFFE65100), size: 35),
        ),
      ),
    );
  }

  void _showNewChatMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.person_add, color: Color(0xFFE65100)),
                title: const Text('New Chat', style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.group_add, color: Color(0xFFE65100)),
                title: const Text('New Group', style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChatList() {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const Divider(height: 1, indent: 80),
      itemBuilder: (context, index) {
        String userName = 'User ${index + 1}';
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPage(name: userName, isGroup: false)),
            );
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade200,
            child: const Icon(Icons.person, color: Color(0xFFE65100)),
          ),
          title: Text(userName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          subtitle: const Text('How is your German learning?', maxLines: 1),
          trailing: const Text('12:45 PM', style: TextStyle(color: Colors.grey, fontSize: 12)),
        );
      },
    );
  }

  Widget _buildGroupList() {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (context, index) => const Divider(height: 1, indent: 80),
      itemBuilder: (context, index) {
        String groupName = 'German Level ${index + 1}';
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPage(name: groupName, isGroup: true)),
            );
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xFFFFE0B2),
            child: const Icon(Icons.group, color: Color(0xFFE65100)),
          ),
          title: Text(groupName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          subtitle: const Text('Admin: Welcome to the group!'),
          trailing: const Text('Yesterday', style: TextStyle(color: Colors.grey, fontSize: 12)),
        );
      },
    );
  }
}

class ChatPage extends StatefulWidget {
  final String name;
  final bool isGroup;
  const ChatPage({super.key, required this.name, this.isGroup = false});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {"text": "Hallo! Wie geht's?", "time": "10:00 AM", "isMe": false},
  ];

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          "text": _controller.text.trim(),
          "time": "${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}",
          "isMe": true,
        });
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFE65100)),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.shade200,
              child: Icon(widget.isGroup ? Icons.group : Icons.person, color: const Color(0xFFE65100), size: 20),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name, style: const TextStyle(color: Color(0xFFE65100), fontSize: 16, fontWeight: FontWeight.bold)),
                const Text('online', style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _messageBubble(msg["text"], msg["time"], msg["isMe"]);
              },
            ),
          ),
          _buildInput(),
        ],
      ),
    );
  }

  Widget _messageBubble(String text, String time, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFFFFE0B2) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: isMe ? Border.all(color: const Color(0xFFE65100)) : null,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2, offset: const Offset(0, 1)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(text, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 4),
            Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20, top: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5, offset: const Offset(0, 2)),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.add, color: Color(0xFFE65100)),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Type message...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xFFE65100),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white, size: 22),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}