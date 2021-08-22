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
        toolbarHeight: 70.0,
        title: Center(
          child: Text(
            'News App',
          style: TextStyle(
            fontSize: 23.0,
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
        padding: EdgeInsets.all(25.0),
        child: Column(

          children: [
            Text(
              'Pick your category of interest',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 28.0,
                fontWeight: FontWeight.w700
              ),
            ),
           SizedBox(
             height: 23.0,
           ),
           Row(
             children: [
               categoriesItem('assets/icons/sports.png'),
               categoriesItem('assets/icons/politics.png')

             ],
           ),
            SizedBox(
              height: 23.0,
            ),
            Row(
              children: [
                categoriesItem('assets/icons/health.png'),
                categoriesItem('assets/icons/business.png')

              ],
            ),

            SizedBox(
              height: 23.0,
            ),
            Row(
              children: [
                categoriesItem('assets/icons/enviroment.png'),
                categoriesItem('assets/icons/science.png')

              ],
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
