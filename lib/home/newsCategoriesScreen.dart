import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../tools/sideMenu.dart';
import 'item.dart';

class newsCategoriesScreen extends StatefulWidget {
  static const routeName = 'newsCategoriesScreen';
  @override
  _newsCategoriesScreenState createState() => _newsCategoriesScreenState();
}

class _newsCategoriesScreenState extends State<newsCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        title: Center(
          child: Text(
            'News App',
            style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w700
            ),
            //  textAlign: TextAlign.right,
          ),
        ),
        //backgroundColor: primaryColor,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(75),
                bottomRight: Radius.circular(75)
            )
        ),
      ),
      drawer: sideMenu(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(padding: EdgeInsets.all(10),
            child: Text(
              'Pick your category of interest',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 28.0,
                fontWeight: FontWeight.w700
              ),
            ),
            ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [
                   Expanded(child: item('assets/icons/redBorder.png', 'assets/icons/sports.png', 'Sports')),
                   Expanded(child: item('assets/icons/blueBorder.png', 'assets/icons/politics.png', 'Politics'))
                 ],
               ),
             ),
           ),
            Expanded(child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: item('assets/icons/pinkBorder.png', 'assets/icons/health.png', 'health')),
                  Expanded(child: item('assets/icons/brown.png', 'assets/icons/business.png', 'Business'))

                ],
              ),
            ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: item('assets/icons/lightBlue.png', 'assets/icons/environment.png', 'Environment')),
                    Expanded(child: item('assets/icons/yellow.png', 'assets/icons/science.png', 'Science'))

                  ],
                ),
              ),
            ),

          ],
        ),

      ),

    );
  }
}


/* Container(
             child: Material(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 190.0,
                  height: 160.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/sports.png'),
                      fit: BoxFit.fill,
                  ),
                ),
                ),
              ),
            ),
      ),*/

/*InkWell(
                 onTap: () {},
                 child: Container(
                   width: 190.0,
                   height: 160.0,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image: AssetImage('assets/icons/sports.png'),
                       fit: BoxFit.contain,
                     ),
                   ),
                 ),
               ),*/
