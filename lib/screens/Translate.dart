import 'package:flutter/material.dart';

class Translate extends StatefulWidget {
  const Translate({super.key});

  @override
  State<Translate> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<Translate> {
  final TextEditingController _controller = TextEditingController();
  String _translatedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          ' Translator',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildLanguageChip("English", true),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFE0B2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.compare_arrows_rounded,
                    color: Color(0xFFE65100),
                    size: 24,
                  ),
                ),
                const Spacer(),
                _buildLanguageChip("German", false),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildCard(
                    child: Column(
                      children: [
                        TextField(
                          controller: _controller,
                          maxLines: 6,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: const InputDecoration(
                            hintText: "Enter text...",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          onChanged: (val) =>
                              setState(() => _translatedText = val),
                        ),
                        Row(
                          children: [
                            _iconAction(Icons.mic_none_rounded),
                            _iconAction(Icons.volume_up_outlined),
                            const Spacer(),
                            if (_controller.text.isNotEmpty)
                              TextButton(
                                onPressed: () => setState(() {
                                  _controller.clear();
                                  _translatedText = "";
                                }),
                                child: const Text(
                                  "Clear",
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _translatedText.isEmpty ? 0 : 1,
                    child: _buildCard(
                      color: Color(0xFFE65100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "TRANSLATION",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _translatedText.isEmpty
                                ? ""
                                : "The word will be translate here", //Api soon will be here
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Divider(color: Colors.white24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _iconAction(
                                Icons.copy_rounded,
                                color: Colors.white,
                              ),
                              _iconAction(
                                Icons.share_rounded,
                                color: Colors.white,
                              ),
                              _iconAction(
                                Icons.star_border_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required Widget child, Color color = Colors.white}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          if (color == Colors.white)
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildLanguageChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Color(0xFFE65100) : Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _iconAction(IconData icon, {Color color = Colors.black45}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color == Colors.white
            ? Colors.white.withOpacity(0.1)
            : Colors.grey.shade100,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: 22),
        onPressed: () {},
      ),
    );
  }
}
