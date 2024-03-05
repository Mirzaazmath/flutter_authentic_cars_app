import 'package:authentic_cars/model/feature_model.dart';
import 'package:flutter/material.dart';

import '../utils/gradient_utils.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// car List
  List<String>carList=["assets/car1.png","assets/car2.png","assets/car3.png","assets/car5.png","assets/car4.png"];
  // storing index for managing colors
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // App Bar
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
        leading:const  Icon(Icons.menu),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Icon(Icons.anchor,size: 34,),
        actions:const  [
          Icon(Icons.add_circle_outline_outlined),
          SizedBox(width: 10,)
        ],
      ),
      body: Stack(
        children: [

          Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height*0.55,
                width: double.infinity,
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                      // Getting gradient from gradiantList based on page index
                      colors:gradiantList[selectedIndex]
                  ), borderRadius:const  BorderRadius.vertical(bottom: Radius.circular(30))
                ),
                alignment: Alignment.center,
                child: Text("1998",style: TextStyle(fontSize: 130,fontWeight: FontWeight.w900,color: Colors.white.withOpacity(0.05)),),
              ),
            const   Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for(int i=0;i<features.length;i++)
                  Container(
                    height: 110,
                    width: 100,
                    padding:const  EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient:const  LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff1c1c1c),
                          Color(0xff222222)
                        ]
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Getting color from colorlist based on page index
                        Icon(features[i].icon,size: 35,color:colorList[selectedIndex],),
                        Text(features[i].title,style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.bold),),
                        Text(features[i].value,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
                      ],
                    ),
                  )
                ],
              ),
             const  SizedBox(height: 50,
             child: Icon(Icons.download_for_offline,color: Colors.white,),)
            ],
          ),
        // Page View To Display Car on top of everything using stack
        PageView.builder(
          onPageChanged: (val){
            setState(() {
              selectedIndex=val;
            });
          },
          scrollDirection: Axis.vertical,
          itemCount: carList.length,
            itemBuilder: (context,index){
          return   Center(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height*0.5,
              width: 250,
              child: Image.asset(carList[index]),
            ),
          );
        }),
          // Custom Page indicator
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20,top: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0;i<carList.length;i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: CircleAvatar(
                        radius: selectedIndex==i?6:4,
                        backgroundColor:selectedIndex==i?colorList[i]: Colors.grey.shade600,
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}