import 'package:flutter/material.dart';
import 'package:todo/style/reusabale_componants/CustomFromFild.dart';
import 'package:todo/style/reusabale_componants/constans.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "Register";
  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();
  GlobalKey<FormState> formKey= GlobalKey<FormState>();
  RegisterScreen({super.key});

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
                      controller: email,
                      type: TextInputType.emailAddress,
                      lable: "Email",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter Password";
                        }if(!isValidEmail(value)){
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
                        }if(value.length<6){
                          return "password Must Contain at least Character ";
                        }
                        return null;
                      }
                    ),
                    CustomFromField(
                      controller: passwordConfirmation,
                      isPassword: true,
                      action: TextInputAction.done,
                      lable: "Password Confirmation",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter Your Name";
                        }if(value.length<6){
                          return "password Must Contain at least Character ";
                        }if(value != password.text){
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

  CreateAccount(){
    formKey.currentState?.validate();
  }
}
