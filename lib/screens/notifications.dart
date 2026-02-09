import 'package:flutter/material.dart';

class notifications extends StatelessWidget {
  const notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFE65100)),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFFE65100),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          _buildNotificationItem(
            icon: Icons.edit_note,
            title: 'New Word Added',
            subtitle: 'Ahmed added a new word: "Entschuldigung"',
            time: '2m ago',
            typeColor: Colors.blue,
          ),
          _buildNotificationItem(
            icon: Icons.group_add,
            title: 'New Member',
            subtitle: 'Nada just joined the "German Level 1" group',
            time: '15m ago',
            typeColor: Colors.green,
          ),
          _buildNotificationItem(
            icon: Icons.chat_bubble_outline,
            title: 'New Message',
            subtitle: 'Marwan sent you a message: "Did you finish the task?"',
            time: '1h ago',
            typeColor: const Color(0xFFE65100),
          ),
          _buildNotificationItem(
            icon: Icons.edit_note,
            title: 'New Word Added',
            subtitle: 'Omar added a new word: "Willkommen"',
            time: '3h ago',
            typeColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required Color typeColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: typeColor.withOpacity(0.1),
          child: Icon(icon, color: typeColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
        trailing: Text(
          time,
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
        onTap: () {},
      ),
    );
  }
}
