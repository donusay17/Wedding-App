import 'package:bootcamp165/constants/constants.dart';
import 'package:bootcamp165/sign_in_page.dart';
import 'package:bootcamp165/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../login_page.dart';
class openingPage extends StatefulWidget {
  const openingPage({Key? key}) : super(key: key);

  @override
  _openingPageState createState() => _openingPageState();
}

class _openingPageState extends State<openingPage> {
  int currentPage = 0;
List<Map<String,String>> splashData = [
  {
    "text": "DüğünümVar ile tüm düğün organizasyonu\ntek bir uygulama "
        "üzerinden planlayabilir\nve takip edebilirsin!",
    "image": "assets/images/wed1.png"
  },
  {
    "text": " Evini DüğünümVar ile döşeyebilirsin.\n Eksikler listeni yap ve "
        "misafirlerini DüğünümVar uygulamasına davet et.Eksiklerini "
        "tamamlasınlar!",
    "image": "assets/images/wed4.png"
  },
  {
    "text": "Davetli listeni hazırlayabilir,görev listeni\ntakip edebilir,"
        "bütçeni kontrol edebilir \n ve daha bir çok şey yapabilirsin.",
    "image": "assets/images/wed3.png"
  },
  {
    "text": "Müstakbel eşini davet edebilir,beraber\ndüğününüzü "
        "planlayabilirsiniz.",
    "image": "assets/images/wed2.png"
  },
];

  var key;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width:double.infinity,
        child: Column(
          children:<Widget> [
            Expanded(
              flex:3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"]!,
                    text: splashData[index]['text']! ,
                ),
                ),
             ),
            Expanded(
               flex:1,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:
                  getProportionateScreenWidth(60)),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length,
                              (index) => buildDot(index:index)),
                      ),
                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(56),
                      child: FlatButton(
                        shape:RoundedRectangleBorder
                          (borderRadius:BorderRadius.circular(20)),
                        color:kPrimaryColor,
                        onPressed:(){

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  signInPage()),
                          );

                      }, child: Text("Yeni Düğün Oluştur",style: TextStyle
                        (fontSize:getProportionateScreenWidth(13),
                      color:Colors.white),),
                      ),
                    ),
                      Spacer(),

                      SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(56),
                        child: FlatButton(
                          shape:RoundedRectangleBorder
                            (borderRadius:BorderRadius.circular(20)),
                          color:kPrimaryColor,
                          onPressed:(){


                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  LoginPage()),
                            );
                          }, child: Text("Varolan Düğüne Katıl",style: TextStyle
                          (fontSize:getProportionateScreenWidth(13),
                            color:Colors.white),),
                        ),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => signInPage()));
                          },
                          child: Text(
                            'Hesabınız yok mu? Kaydolun',
                            style: TextStyle(color: Colors.black),
                          )),

                    ],
                  ),
                ),
            ),

          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
                    duration: kAnimationDuration,
                    margin: EdgeInsets.only(right: 5),
                    height: 6,
                    width: currentPage== index ? 20: 6,
                    decoration: BoxDecoration(
                      color: currentPage== index ? kPrimaryColor: Color(0xFFD8D8D8) ,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
  }
}
class SplashContent extends StatelessWidget{
const SplashContent({
   Key? key, required this.text, required this.image,
}): super(key:key);
final String text, image;

  @override
  Widget build(BuildContext context) {
  return Column(
    children:<Widget> [

      Spacer(flex:1),
      Image.asset(image,
        height: getProportionateScreenHeight(500),
        width: getProportionateScreenWidth(500),
      ),
      Align(
        alignment: Alignment.center,
        child: Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getProportionateScreenWidth(15),
          fontWeight: FontWeight.normal,

        ),),
      ),

    ],
  );
  }}
