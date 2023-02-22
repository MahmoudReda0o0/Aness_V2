import 'package:audioplayers/audioplayers.dart';
import 'package:autism_app/UI/helper/constant.dart';
import 'package:flutter/material.dart';

class AppInfo extends StatefulWidget {
  State<StatefulWidget> createState() => AppInfo_s();
}

class AppInfo_s extends State<AppInfo> {
  bool alige = false;
  //AudioPlayer audioPlayer=AudioPlayer().setSource('assets');
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  child: Image(
                    height: MyPageSize.height(context) * 0.15,
                    width: MyPageSize.width(context),
                    fit: BoxFit.fill,
                    image: AssetImage('assets/image/backscreen1.png'),
                  ),
                ),
                Container(
                  height: MyPageSize.height(context) * 0.8,
                  width: MyPageSize.width(context),
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/image/backscreen.png'),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: MyPageSize.height(context) * 0.15,
                  width: MyPageSize.width(context),
                  child: Center(
                    child: Text(
                      'الإرشادات ',
                      style: TextStyle(fontSize: 20, color: MyColor().gray),
                    ),
                  ),
                ),
                Container(
                  height: MyPageSize.height(context) * 0.8,
                  width: MyPageSize.width(context),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: MyPageSize.width(context),
                          child: Text('''
              لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت ...
              وعند موافقه العميل المبدئيه على التصميم يتم ازالة هذا النص من التصميم ويتم وضع النصوص النهائية المطلوبة للتصميم ويقول البعض ان وضع النصوص التجريبية بالتصميم قد تشغل المشاهد عن وضع الكثير من الملاحظات او الانتقادات للتصميم الاساسي.
              وخلافاَ للاعتقاد السائد فإن لوريم إيبسوم ليس نصاَ عشوائياً، بل إن له جذور في الأدب اللاتيني الكلاسيكي منذ العام 45 قبل الميلاد.
              '''),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() => alige = !alige);
                          },
                          child: Center(
                            child: Container(
                              height: 250,
                              width: double.infinity,
                              color: MyColor().gray_wihte2,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(8),
                              child: AnimatedAlign(
                                alignment: alige
                                    ? Alignment.topLeft
                                    : Alignment.bottomRight,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInBack,
                                child: FlutterLogo(
                                  size: 100,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MyPageSize.width(context),
                          child: Text('''
              لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت ...
              وعند موافقه العميل المبدئيه على التصميم يتم ازالة هذا النص من التصميم ويتم وضع النصوص النهائية المطلوبة للتصميم ويقول البعض ان وضع النصوص التجريبية بالتصميم قد تشغل المشاهد عن وضع الكثير من الملاحظات او الانتقادات للتصميم الاساسي.
              وخلافاَ للاعتقاد السائد فإن لوريم إيبسوم ليس نصاَ عشوائياً، بل إن له جذور في الأدب اللاتيني الكلاسيكي منذ العام 45 قبل الميلاد.
              '''),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
