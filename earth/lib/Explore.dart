import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:animations/animations.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:sidebarx/sidebarx.dart';

import 'mercury.dart';

class Explore extends StatefulWidget {
   



  const Explore({Key? key}) : super(key: key);
  @override
  _ExploreState createState() => _ExploreState();
}

const primaryColor = Color(0xFF6252DA);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF7777B6);

class _ExploreState extends State<Explore> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Builder(
          builder: (context) {
            final isSmallScreen = MediaQuery.of(context).size.width < 600;
            return Scaffold(
              key: _key,
              backgroundColor: Colors.transparent,
              appBar: isSmallScreen
                  ? AppBar(
                      leading: IconButton(
                        onPressed: () {
                          _key.currentState?.openDrawer();
                        },
                        icon: Icon(Icons.menu),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    )
                  : null,
              drawer: SideBarXExample(controller: _controller),
              body: Row(
                children: [
                  if (!isSmallScreen)
                    SideBarXExample(controller: _controller),
                  Expanded(
                    child:  Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(25.sp),
                  child:TextButton(onPressed: (){}, child:  Text(
                  'Explore',
                  style: GoogleFonts.openSans(
                    letterSpacing: 8.5.sp,
                    fontSize: 26.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                            ), )
                
                ),
              ),
                             
                            
                  ),
                   
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
class SideBarXExample extends StatelessWidget {
  const SideBarXExample({Key? key, required SidebarXController controller}) : _controller = controller,super(key: key);
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      
      controller: _controller,
      theme:   SidebarXTheme(
        decoration: BoxDecoration(
            color: Colors.black38.withOpacity(0.2),
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp),bottomRight: Radius.circular(20.sp)),
             boxShadow: [
      BoxShadow(
        color: Colors.black38.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedTextStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        textStyle:const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)
      ),
      extendedTheme: SidebarXTheme(
          width:100.w
      ),
      footerDivider: Divider(color:  Colors.white.withOpacity(0.8), height: 1),
      headerBuilder: (context,extended){
        return   SizedBox(
          height: 100,
           child: Image.asset('assets/aa.png',width: 15.w,)
          //Icon(Icons.spa,size: 30.sp,color: Colors.white)
        );
      },
      items:  [

        SidebarXItem(iconWidget: Image.asset('assets/m.png',width: 10.w,height: 5.h,), label: 'Mercury', onTap: (){Get.to(Mercury());}),
        SidebarXItem(iconWidget: Image.asset('assets/v.png',width: 10.w,height: 5.h,), label: 'Venus'),
        SidebarXItem(iconWidget: Image.asset('assets/E.png',width: 10.w,height: 5.h,), label: 'Earth'),
        SidebarXItem(iconWidget: Image.asset('assets/Mars.png',width: 10.w,height: 5.h,), label: 'Mars'),
         SidebarXItem(iconWidget: Image.asset('assets/J.png',width: 10.w,height: 5.h,),label: 'Jupiter'),
          SidebarXItem(iconWidget: Image.asset('assets/S.png',width: 10.w,height: 5.h,), label: 'Saturn'),
           SidebarXItem(iconWidget: Image.asset('assets/u.png',width: 10.w,height: 5.h,), label: 'Uranus'),
           SidebarXItem(iconWidget: Image.asset('assets/n.png',width: 10.w,height: 5.h,), label: 'Neptune'),
      ],
    );
  }
}