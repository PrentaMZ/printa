import 'package:flutter/material.dart';
import 'package:printa/shared/styles/colors.dart';
import 'package:printa/view/order_status/active_order/active_order.dart';
import 'package:printa/view/order_status/cancelled_order/cancelled_order.dart';
import 'package:printa/view/order_status/completed_order/comleted_order.dart';

class UserOrders extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
     length: 3,
     child: Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('My Orders'),
           centerTitle: true,
           elevation: 0.0,
           surfaceTintColor: Colors.transparent,
         ),
         body:Column(
           children: [
             TabBar(

               indicator: UnderlineTabIndicator(
                 borderSide: BorderSide(
                     width: 4.0,
                     color: firstColor
                 ),
               ),
                 dividerColor: Colors.transparent,
                 labelColor: firstColor,
                 tabs: [
                   Tab(text: 'Active'),
                   Tab(text: 'Completed',),
                   Tab(text: 'Cancelled',)
                 ]),

             Expanded(
               child: TabBarView(
                 physics: NeverScrollableScrollPhysics(),
                   children: [
                 ActiveOrder(),
                 CompletedOrder(),
                 CancelledOrder(),
               ]),
             )
           ],
         ) ,
       ),
     ),
   );
  }
}