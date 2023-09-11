import 'package:chat/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../cubit/register/register_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'chat_page.dart';


class RegisterPageState extends StatelessWidget {
  static String id = 'RegisterPage';
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: kPrimaryColor,
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
      if(state is RegisterReplay){
        showModalBottomSheet(context: context, builder: (context){
          return Text("${state.Error}");
        });
        isLoading = false;
      }if(state is Registersuccess){
        isLoading = true;
        Navigator.pushReplacementNamed(context, LoginPageState.id,arguments:email);
      }if(state is Registerloading){
        isLoading = false;
      }

          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 75,
                      ),
                      Image.asset(
                        'assets/images/scholar.png',
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Scholar Chat',
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontFamily: 'pacifico',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 75,
                      ),
                      Row(
                        children: [
                          Text(
                            'REGISTER',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormTextField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Email',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomFormTextField(

                        onChanged: (data) {
                          password = data;
                        },
                        hintText: 'Password',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButon(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context).Register(
                                email: email!, password: password!);
                          }
                        },

                        text: 'REGISter',),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already have an account?',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              '  Login',
                              style: TextStyle(
                                color: Color(0xffC7EDE6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
  }

}
