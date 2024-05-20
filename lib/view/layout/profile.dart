import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:printa/shared/components/components.dart';
import 'package:printa/shared/styles/colors.dart';

class profile_screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title:Text('Profile Settings',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      child: Image(image: AssetImage('images/google.png'),fit: BoxFit.fill,),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 20,
                      child: Icon(Icons.camera_alt_outlined),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Text('Mahmoud Samir'),
                SizedBox(height: 5,),
                Text('MahmoudSamir1999@hotmail.com'),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Profile',style: TextStyle(fontWeight: FontWeight.w400),),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 15,),
                      Text('Edit Profile'),
                      Spacer(),
                      IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward_ios_sharp))
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 15,),
                      Text('Dark Mode'),
                      Spacer(),
                      IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward_ios_sharp))
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Icons.wallet),
                      SizedBox(width: 15,),
                      Text('Orders'),
                      Spacer(),
                      IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward_ios_sharp))
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text('Support',style: TextStyle(fontWeight: FontWeight.w400),),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Icons.warning),
                      SizedBox(width: 15,),
                      Text('Help Center'),
                      Spacer(),
                      IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward_ios_sharp))
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Icons.warning),
                      SizedBox(width: 15,),
                      Text('Terms of Service'),
                      Spacer(),
                      IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward_ios_sharp))
                    ],
                  ),
                  SizedBox(height: 30,),
                  Center(
                      child:
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color:firstColor
                          )
                        ),
                        child: MaterialButton(

                          height: 60,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all( Radius.circular(30),),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.output_outlined),
                              SizedBox(width: 15,),
                              Text('Sign out'),
                            ],
                          ),
                          onPressed: (){},


                        ),
                      )


                  ),
                  SizedBox(height: 20,)


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}