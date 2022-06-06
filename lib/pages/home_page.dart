
import 'package:bootcamp165/constants/constants.dart';
import 'package:bootcamp165/extensions/context_extensions.dart';
import 'package:bootcamp165/guest_page.dart';
import 'package:flutter/material.dart';


import '../timerPage/mainTimer.dart';
import '../toDoPage/mainPage.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}


class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {


    context.displaySize(context);


    
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(context.dynamicWidth(0.05)),
        child: Column(children: [
          Expanded(
            flex: context.dynamicHeight(0.2).toInt(),
            child: Image.asset("assets/images/wed2.png"),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: context.dynamicHeight(0.4).toInt(),
              child:Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration:  homePageBoxDecoration,

                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute
                                  (builder:  (context)=>mainTimers(title: 'DÜ'
                                    'ĞÜNÜM VAR',)));

                              },
                              child: Row(children: [
                                Expanded(child: homePageTextWidget("DÜĞÜN SAYACI")),
                                Expanded(child: homePageImagesWidget("timer64.png"))
                              ],),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex:8,
                        child: Container(
                          decoration:  homePageBoxDecoration,

                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () {

                                Navigator.push(context,
                                  MaterialPageRoute(builder:  (context)=>guestPage()));},
                              child: Row(children: [
                                Expanded(child: homePageTextWidget("DAVETLİ LİSTESİ")),
                                Expanded(child: homePageImagesWidget("davetli.png"))
                              ],),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),

                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration:  homePageBoxDecoration,

                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () {

                                Navigator.push(context,
                                    MaterialPageRoute(builder:  (context)
                                    =>homeToDo()));},
                              child: Row(children: [
                                Expanded(child: homePageTextWidget("KONTROL LİSTESİ")),
                                Expanded(child: homePageImagesWidget("checklist.png"))
                              ],),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex:8,
                        child: Container(
                          decoration:  homePageBoxDecoration,

                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () {  Navigator.push(context,
                                  MaterialPageRoute(builder:  (context)=>guestPage()));},
                              child: Row(children: [
                                Expanded(child: homePageTextWidget("BÜTÇE PLANLAMA")),
                                Expanded(child: homePageImagesWidget("wallet.png"))
                              ],),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),

                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration:  homePageBoxDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () {  Navigator.push(context,
                                  MaterialPageRoute(builder:  (context)=>guestPage()));},
                              child: Row(children: [
                                Expanded(child: homePageTextWidget("EV EKSİKLERİ")),
                                Expanded(child: homePageImagesWidget("gift.png"))
                              ],),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex:8,
                        child: Container(
                          decoration:  homePageBoxDecoration,

                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () {  Navigator.push(context,
                                  MaterialPageRoute(builder:  (context)=>guestPage()));},
                              child: Row(children: [
                                Expanded(child: homePageTextWidget("DÜĞÜN ÖRNEKLERİ")),
                                Expanded(child: homePageImagesWidget("balloons.png"))
                              ],),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration:  homePageBoxDecoration,

                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () {  Navigator.push(context,
                                  MaterialPageRoute(builder:  (context)=>guestPage()));},
                              child: Row(children: [
                                Expanded(child: homePageTextWidget("FOTOĞRAF ALBÜMÜ")),
                                Expanded(child: homePageImagesWidget("image.png"))
                              ],),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex:8,
                        child: Container(
                          decoration:  homePageBoxDecoration,

                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () {  Navigator.push(context,
                                  MaterialPageRoute(builder:  (context)=>guestPage()));},
                              child: Row(children: [
                                Expanded(child: homePageTextWidget("TAKVİM PLANLAMA")),
                                Expanded(child: homePageImagesWidget("takvim.png"))
                              ],),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration:  homePageBoxDecoration,

                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () {  Navigator.push(context,
                                  MaterialPageRoute(builder:  (context)=>guestPage()));},
                              child: Row(children: [
                                Expanded(child: homePageTextWidget("ALIŞVERİŞ")),
                                Expanded(child: homePageImagesWidget("shop.png"))
                              ],),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex:8,
                        child: Container(
                          decoration:  homePageBoxDecoration,

                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () {  Navigator.push(context,
                                  MaterialPageRoute(builder:  (context)=>guestPage()));},
                              child: Row(children: [
                                Expanded(child: homePageTextWidget("INVITATION CODE/QR")),
                                Expanded(child: homePageImagesWidget("qr.png"))
                              ],),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
          )
        ]),
      ),
    );
  }
}
