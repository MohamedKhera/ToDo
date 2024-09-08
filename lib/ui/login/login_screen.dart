import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/FirebaseCode.dart';
import 'package:todo/firebase/firestore_helper.dart';
import 'package:todo/shared/auth_provider.dart';
import 'package:todo/style/diloge_utils.dart';
import 'package:todo/style/reusabale_componants/CustomFromFild.dart';
import 'package:todo/style/reusabale_componants/constans.dart';
import 'package:todo/ui/home/home_screen.dart';
import 'package:todo/ui/register/register_screen.dart';
import 'package:todo/model/user.dart' as MyUser;

class LoginScreen extends StatefulWidget {
  static const String routeName = "Login";

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControlar = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor!.withOpacity(0),
          toolbarHeight: 60,
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
                      controller: emailControlar,
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

  login() async {
    Authprovider provider = Provider.of<Authprovider>(context, listen: false);
    if (formKey.currentState?.validate() ?? false){
      try {
        DialogUtils.showLoadingDialog(context: context);
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControlar.text.trim(),
          password: password.text,
        );

        MyUser.User? user = await FirestoreHelper.GetUser(credential.user!.uid);
        provider.setUsers(credential.user, user);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } on FirebaseAuthException catch (e) {
        if (e.code == emailNotFound) {
          Navigator.pop(context);
          DialogUtils.showMessageDialog(
            context: context,
            message: "No user found for that email.",
            onPress: () {
              Navigator.pop(context);
            },
          );
        } else if (e.code == wrongPassword) {
          Navigator.pop(context);
          DialogUtils.showMessageDialog(
            context: context,
            message: "Wrong password provided for that user.",
            onPress: () {
              Navigator.pop(context);
            },
          );
        }
      }
    }
  }
}
