import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:printa/shared/styles/colors.dart';
import 'package:printa/view/edit_user_profile/edit_user_profile.dart';
import 'package:printa/view/user_profile/profile.dart';
import 'package:printa/view_model/prenta_layout/prenta_cubit.dart';
import 'package:printa/view_model/prenta_layout/prenta_states.dart';
import '../../shared/components/components.dart';

class EditAddress extends StatelessWidget{
  var cityController=TextEditingController();
  var areaController=TextEditingController();
  var stController=TextEditingController();
  var buildingController=TextEditingController();
  var floorController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrentaCubit,PrentaStates>(

      listener: (context,state){
        if(state is PrentaGetUserSuccessState) {
          navigateTo(context, Profile());
          showToast(context, title: 'Success', description: 'Address has been updated', state: ToastColorState.success, icon: Ionicons.thumbs_up_outline);
        }
      },
      builder: (context,state){

        var cubit=PrentaCubit.get(context);
        cityController.text= PrentaCubit.get(context).userInfo!.city.toString();
        areaController.text= PrentaCubit.get(context).userInfo!.area.toString();
        stController.text= PrentaCubit.get(context).userInfo!.streetName.toString();
        buildingController.text= PrentaCubit.get(context).userInfo!.building.toString();
        floorController.text= PrentaCubit.get(context).userInfo!.floor.toString();
        return Scaffold(
          backgroundColor: thirdColor,
          appBar: AppBar(
            backgroundColor: thirdColor,
            leading: IconButton(icon: Icon(Ionicons.chevron_back_outline),onPressed: (){
              Navigator.pop(context);
            },),
            title: Text('Edit Address'),
            centerTitle:true ,
          ),
          body: Container(
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('City', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,)),
                      SizedBox(height: 8),
                      defaultTextFormField(
                        controller: cityController,
                        KeyboardType: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your city';
                          } else {
                            return null;
                          }
                        },
                        lable: 'City',
                        prefix: Icons.location_city,
                      ),
                      SizedBox(height: 15,),
                      Text('Area', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(height: 8),
                      defaultTextFormField(
                        controller: areaController,
                        KeyboardType: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the area you live in';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Area',
                        prefix: Icons.area_chart_outlined,
                      ),
                      SizedBox(height: 15,),
                      Text('Street name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(height: 8),
                      defaultTextFormField(
                        controller: stController,
                        KeyboardType: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your st.name';
                          } else {
                            return null;
                          }
                        },
                        lable: 'st.name',
                        prefix: Icons.stacked_line_chart,
                      ),
                      SizedBox(height: 15,),
                      Text('Building', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(height: 8),
                      defaultTextFormField(
                        controller: buildingController,
                        KeyboardType: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your building';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Building',
                        prefix: Icons.home,
                      ),
                      SizedBox(height: 15,),
                      Text('Floor', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(height: 8),
                      defaultTextFormField(
                        controller: floorController,
                        KeyboardType: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your floor number';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Floor',
                        prefix: Icons.roofing,
                      ),
                      SizedBox(height: 30,),
                      Center(child: defaultMaterialButton(text: 'Submit', Function: (){
                        if (formKey.currentState!.validate()) {
                          cubit.updateUserAddress(
                              streetName: stController.text,
                              floor: floorController.text,
                              city: cityController.text,
                              building: buildingController.text,
                              area: areaController.text
                          );
                        }
                      }))
                    ],
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)
                )
            ),
          ),
        );
      }
    );
  }
}