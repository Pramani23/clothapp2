import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void submitEmail() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset link sent to your email'),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              // Top header
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Text(
                    'Forgot password',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 75),

              // Email title
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // Email input
              Row(
                children: [
                  Container(
                    width: 31,
                    height: 30,
                    color: const Color(0xFFEFF3FF),
                    child: const Icon(
                      Icons.mail_outline,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(width: 17),

                  Expanded(
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$',
                        ).hasMatch(value.trim())) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Email',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // Submit button
              Center(
                child: SizedBox(
                  width: 95,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: submitEmail,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC8B1C8),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}