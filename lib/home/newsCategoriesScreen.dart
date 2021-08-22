import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/categoriesItem.dart';

class newsCategories extends StatefulWidget {
  static const routeName = 'newsCategoriesScreen';
  @override
  _newsCategoriesState createState() => _newsCategoriesState();
}

class _newsCategoriesState extends State<newsCategories> {
  //static final Color primaryColor = Color.fromARGB(255, 57, 165, 82);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.0,
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
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50)
          )
        ),
      ),
      drawer: Drawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(

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
             child: Row(
               children: [
                 Expanded(child: categoriesItem('assets/icons/sports.png')),
                 Expanded(child: categoriesItem('assets/icons/politics.png'))

               ],
             ),
           ),
            Expanded(child: Row(
              children: [
                Expanded(child: categoriesItem('assets/icons/health.png')),
                Expanded(child: categoriesItem('assets/icons/business.png'))

              ],
            ),
            ),

            Expanded(
              child: Row(
                children: [
                  Expanded(child: categoriesItem('assets/icons/enviroment.png')),
                  Expanded(child: categoriesItem('assets/icons/science.png'))

                ],
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
