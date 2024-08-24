import 'package:flutter/material.dart';
import 'package:todo/style/reusabale_componants/CustomFromFild.dart';
import 'package:todo/style/reusabale_componants/constans.dart';
import 'package:todo/ui/register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "Login";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFromField(
                      controller: email,
                      type: TextInputType.emailAddress,
                      lable: "Email",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter Password";
                        }
                        if (!isValidEmail(value)) {
                          return "Enter valid Email";
                        }
                        return null;
                      },
                    ),
                    CustomFromField(
                        controller: password,
                        isPassword: true,
                        lable: "Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please Enter Password";
                          }
                          if (value.length < 6) {
                            return "password Must Contain at least Character ";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 35,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Login",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: const Text(
                        "Or Create Account",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() {
    formKey.currentState?.validate();
  }
}
