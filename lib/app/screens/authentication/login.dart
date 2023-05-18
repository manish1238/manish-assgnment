import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vivatech/app/screens/registration/register.dart';

import '../../utils/config.dart';
import '../dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obsecureText = false;
  bool isLoading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepOrangeAccent.shade200,
                Colors.white,
              ]),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Log IN',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'User ID',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your User ID';
                            }
                            return null;
                          },
                          maxLines: 1,
                          style: const TextStyle(color: Colors.black),
                          controller: userController,
                          decoration: const InputDecoration(
                            errorStyle: TextStyle(
                              // Set the error text color
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          controller: passwordController,
                          obscureText: obsecureText,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(
                              // Set the error text color
                              color: Colors.black,
                            ),
                            suffix: IconButton(
                              onPressed: () => setState(() {
                                obsecureText = !obsecureText;
                              }),
                              icon: Icon(
                                obsecureText
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off,
                                size: 20,
                              ),
                            ),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Forgot your password',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () => validate(),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Get.to(
                      const Registration(),
                      transition: Transition.rightToLeft,
                    ),
                    child: const Text(
                      'Register your self',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Powered by: ${Config.poweredBy}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Version No ${Config.versionNumber}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackBar(
          {required String title, required Color color}) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 90,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 48,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      const Text(
                        'Message',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(20)),
                child: Image.asset(
                  'assets/pngs/bubble.png',
                  height: 60,
                  width: 60,
                  color: color,
                ),
              ),
            ),
            Positioned(
                top: -12,
                left: 0,
                child: InkWell(
                    onTap: () {},
                    child: ClipOval(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          color: const Color(0xFF801336),
                          child: const Icon(
                            Icons.person,
                            color: Colors.black,
                          )),
                    )))
          ],
        ),
      ));

  void validate() async {
    if (formKey.currentState!.validate()) {
      isLoading = false;
      Get.to(
        const Dashboard(),
        transition: Transition.rightToLeft,
      );
    } else {
      print('error in login validation');
      isLoading = false;
    }
  }
}
