import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_intership/screens/second_screen.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';
import 'first_screen.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  var emailCon = TextEditingController();
  var passCon = TextEditingController();
  int currentIndex =0;

  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xffFFFFFF),
            body: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/img_1.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset("assets/images/img.png")),
                      const SizedBox(height: 20,),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: ToggleButtons(
                            selectedColor: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xff4EA831),
                            fillColor: const Color(0xff4EA831),
                            onPressed: (newIndex){

                              setState(() {
                                for(int index = 0 ; index<cubit.buttonIsSelected.length;index++)
                                {
                                  if(index==newIndex)
                                  {
                                    cubit.buttonIsSelected[index]=true;
                                    Navigator.pushAndRemoveUntil(
                                      context, MaterialPageRoute(
                                        builder: (context)=>SecondScreen()),
                                          (route) => false,
                                    );
                                  }
                                  else
                                  {
                                    cubit.buttonIsSelected[index]=false;
                                    Navigator.pushAndRemoveUntil(
                                      context, MaterialPageRoute(
                                        builder: (context)=>FirstScreen()),
                                          (route) => false,
                                    );
                                  }
                                }
                              });
                            },
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Text("Live"),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text("Paper Trading"),
                              ),
                            ],
                            isSelected: cubit.buttonIsSelected,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Text(
                        "Practise with paper trading",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff4EA831),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff4EA831),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: const [
                          Text(
                            "Don’t have an account? ",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Sign Up.",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff4EA831),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: emailCon,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter your email";
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "username or Email",
                          prefixIcon: const Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        obscureText: cubit.isVisible,
                        controller: passCon,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password is too short";
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: cubit.isVisible
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: () {
                              cubit.changeSuffixIcon();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff4EA831),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            primary: const Color(0xff4EA831),
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20,
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
          ),
        );
      },
    );
  }
}
