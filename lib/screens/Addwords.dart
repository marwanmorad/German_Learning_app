import 'package:flutter/material.dart';
import 'package:language_learning_app/screens/wordDetails.dart';

class AddWords extends StatefulWidget {
  const AddWords({super.key});

  @override
  State<AddWords> createState() => _AddWordsState();
}

class _AddWordsState extends State<AddWords> {
  
  final List<String> _words = ["Apfel", "Brot", "Wasser"];
  
  final TextEditingController _controller = TextEditingController();


  void _addNewWord() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _words.add(_controller.text.trim());
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFE65100)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Words',
          style: TextStyle(
            color: Color(0xFFE65100),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
         
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _words.length,
              itemBuilder: (context, index) {
                return _buildWordCard(_words[index]);
              },
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Type word here..",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: _addNewWord,
                  child: const CircleAvatar(
                    backgroundColor: Color(0xFFFFE0D0), 
                    radius: 25,
                    child: Icon(Icons.send, color: Color(0xFFE65100)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildWordCard(String word) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                word,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Icon(Icons.delete_outline, color: Color(0xFFE65100)),
            ],
          ),
          const Divider(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  WordDetailsPage(word: word)
                    ),
                  );
                },
                child: const Row(
                  children: [
                    Icon(Icons.chat_bubble_outline, size: 20, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("Sentences", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const Row(
                children: [
                  Icon(Icons.mic_none, size: 20, color: Color(0xFFE65100)),
                  SizedBox(width: 8),
                  Text("Record", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}