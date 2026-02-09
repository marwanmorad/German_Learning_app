import 'package:flutter/material.dart';
import 'package:language_learning_app/screens/notifications.dart';
import 'package:language_learning_app/screens/settings.dart';
import 'package:language_learning_app/screens/data.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0,
        title: const Text(
          'SprachHub',
          style: TextStyle(
            color: Color(0xFFE65100),
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.settings, size: 30.0, color: Colors.white),
          onPressed: () => Navigator.of(
            context,
            rootNavigator: true,
          ).push(MaterialPageRoute(builder: (context) => const SettingsPage())),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_active_sharp,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const notifications()),
              ).then((value) => setState(() {}));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 50,
                        child: Container(color: Colors.red.shade700),
                      ),
                      Expanded(flex: 30, child: Container(color: Colors.amber)),
                      Expanded(
                        flex: 20,
                        child: Container(color: Colors.grey.shade900),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statItem(
                    '${AppData.words.length}',
                    'My total Words',
                    Colors.red,
                  ),
                  _statItem('2.30K', 'Team', Colors.amber),
                  _statItem('30', 'Days', Colors.black),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: AppData.words.isEmpty
                    ? Column(
                        children: [
                          const Icon(
                            Icons.add_to_photos_outlined,
                            color: Colors.grey,
                            size: 60,
                          ),
                          const SizedBox(height: 15),
                          const Text("No words added yet"),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Myhome(),
                                ),
                              ).then((value) => setState(() {}));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Text(
                              "Start Adding",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            "Word ${currentIndex + 1} of ${AppData.words.length}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            AppData.words[currentIndex % AppData.words.length],
                            style: const TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 35),
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  currentIndex =
                                      (currentIndex + 1) % AppData.words.length;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                "Next Word",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        currentIndex =
                                            (currentIndex + 1) %
                                            AppData.words.length;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red.shade700,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: const Text(
                                      "Hard",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        currentIndex =
                                            (currentIndex + 1) %
                                            AppData.words.length;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: const Text(
                                      "Easy",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
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
    );
  }

  Widget _statItem(String v, String l, Color c) {
    return Column(
      children: [
        Text(
          v,
          style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(l, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
