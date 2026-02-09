import 'package:flutter/material.dart';
import 'package:language_learning_app/screens/bottomnavigation.dart';

class auth_screen extends StatefulWidget {
  const auth_screen({super.key});

  @override
  State<auth_screen> createState() => _LoginPageState();
}

class _LoginPageState extends State<auth_screen> {
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Icon(
                Icons.menu_book_rounded,
                size: 90,
                color: Color(0xFFE65100),
              ),
              const SizedBox(height: 10),
              const Text(
                'SprachHub',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE65100),
                ),
              ),
              const Text(
                'Your way to success',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 50),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => isAdmin = false),
                        child: Container(
                          decoration: BoxDecoration(
                            color: !isAdmin
                                ? Color(0xFFE65100)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Member',
                            style: TextStyle(
                              color: !isAdmin ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => isAdmin = true),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isAdmin
                                ? Color(0xFFE65100)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Admin',
                            style: TextStyle(
                              color: isAdmin ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              _buildInputBox(Icons.group_outlined, 'Group ID'),
              const SizedBox(height: 15),
              _buildInputBox(Icons.lock_outline, 'Password', isPass: true),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget password?',
                    style: TextStyle(
                      color: Color(0xFFE65100),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const botnavbar(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE65100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'sign in',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              const Text(
                'Or sign in with',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFFE65100), width: 2),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.g_mobiledata, color: Colors.white, size: 45),
                    Text(
                      'Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputBox(IconData icon, String hint, {bool isPass = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: isPass,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color(0xFFE65100)),
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}
