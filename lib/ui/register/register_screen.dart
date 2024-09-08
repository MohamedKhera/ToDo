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
import 'package:todo/model/user.dart'as MyUser;

class RegisterScreen extends StatefulWidget {
  static const String routeName = "Register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullName = TextEditingController();

  TextEditingController userName = TextEditingController();

  TextEditingController emailControlar = TextEditingController();

  TextEditingController passwordControlar = TextEditingController();

  TextEditingController passwordConfirmation = TextEditingController();

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
          elevation: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor!.withOpacity(0),
          title: Text(
            "Create Account",
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFromField(
                      controller: fullName,
                      type: TextInputType.name,
                      lable: "Full Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter Your Name";
                        }
                        return null;
                      },
                    ),
                    CustomFromField(
                      controller: userName,
                      type: TextInputType.name,
                      lable: "UserName",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter Your userName";
                        }
                        return null;
                      },
                    ),
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
                        controller: passwordControlar,
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
                    CustomFromField(
                      controller: passwordConfirmation,
                      isPassword: true,
                      action: TextInputAction.done,
                      lable: "Password Confirmation",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter Your Name";
                        }
                        if (value.length < 6) {
                          return "password Must Contain at least Character ";
                        }
                        if (value != passwordControlar.text) {
                          return "Password Don't Match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        CreateAccount();
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
                              "Create Account",
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  CreateAccount() async {
    Authprovider provider = Provider.of<Authprovider>(context,listen: false);
    if (formKey.currentState?.validate() ?? false) {
      try {
        DialogUtils.showLoadingDialog(context: context);
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailControlar.text.trim(),
          password: passwordControlar.text,
        );
        FirestoreHelper.AddUser(
            emailControlar.text,
            fullName.text,
            credential.user!.uid,
        );
        Navigator.pop(context);
        DialogUtils.showMessageDialog(
            context: context,
            message: "Account Created SuccessFull ${credential.user?.email??""}",
            onPress: () {
              provider.setUsers(credential.user, MyUser.User(
                  id: credential.user!.uid,
                  fullname: fullName.text,
                  email:  emailControlar.text,));
              Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route)=>false);
            });
        print(credential.user?.email);
      } on FirebaseAuthException catch (e) {
        if (e.code == weakPass) {
          Navigator.pop(context);
          DialogUtils.showMessageDialog(
              context: context,
              message: 'The password provided is too weak.',
              onPress: () {
                Navigator.pop(context);
              });
        } else if (e.code == emailUsed) {
          Navigator.pop(context);
          DialogUtils.showMessageDialog(
              context: context,
              message: 'The account already exists for that email.',
              onPress: () {
                Navigator.pop(context);
              });
        }
      } catch (e) {
        Navigator.pop(context);
        DialogUtils.showMessageDialog(
            context: context,
            message: '${e.toString()}',
            onPress: () {
              Navigator.pop(context);
            },
        );
      }
    }
  }
}
