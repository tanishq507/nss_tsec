import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../model/items_model.dart';
import '../components.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    /// IMG
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                      width: size.width,
                      height: size.height / 2.5,
                      child: FadeInDown(
                        delay: Duration(milliseconds: 100),
                        child: Image.asset(listOfItems[0].img),
                      ),
                    ),

                    /// TITLE TEXT
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 15),
                      child: FadeInDown(
                        delay: Duration(milliseconds: 300),
                        child: Text(
                          listOfItems[0].title,
                          textAlign: TextAlign.center,
                          style: textTheme.displayLarge,
                        ),
                      ),
                    ),

                    /// SUBTITLE TEXT
                    FadeInDown(
                      delay: Duration(milliseconds: 500),
                      child: Text(
                        listOfItems[0].subTitle,
                        textAlign: TextAlign.center,
                        style: textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// ---------------------------
            Expanded(
              flex: 1,
              child: Center(
                child: GetStartBtn(size: size, textTheme: textTheme),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
