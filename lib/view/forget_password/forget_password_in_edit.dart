import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:printa/shared/components/components.dart';
import 'package:printa/view_model/login_body/login_body_cubit.dart';
import 'package:printa/view_model/login_body/login_body_states.dart';
import 'package:printa/view_model/prenta_layout/prenta_cubit.dart';
import 'package:printa/view_model/prenta_layout/prenta_states.dart';

class Reset_password_in_edit extends StatelessWidget{
  var emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    emailController.text=PrentaCubit.get(context).userInfo!.email.toString();
    return BlocProvider(
      create: (BuildContext context) =>PrentaCubit(),
      child: BlocConsumer<PrentaCubit,PrentaStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Reset Password',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Text('Enter your registered email below so we can send an email to reset your password',style: TextStyle(color: Colors.grey,fontSize: 16),),
                    SizedBox(height: 25,),

                    defaultTextFormField(
                      controller: emailController,
                      KeyboardType: TextInputType.emailAddress,
                      validate: (value){
                        if(value!.isEmpty){
                          return 'Please enter your email';
                        }
                        else{
                          return null;
                        }
                      },
                      enabled: false,
                      lable: 'Email Address',
                      prefix:  Ionicons.mail_outline,
                    ),

                    SizedBox(height: 25,),
                    Center(child: Image(image: AssetImage('images/change_password.png'))),
                    SizedBox(height: 40,),
                    Center(child: defaultMaterialButton(text: 'Send', Function: (){
                      PrentaCubit.get(context).resetPassword(context:context,email: emailController.text.trim());

                    })),
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