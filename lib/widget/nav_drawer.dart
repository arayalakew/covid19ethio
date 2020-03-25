import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'የኮሮና ቫይረስ በኢትዮጵያ መከታተያ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/coronavirus.jpg'))),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('መረጃ'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.local_pharmacy),
              title: Text('የበሽታው ምልክቶች'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('እርዳታ እፈልጋለሁ'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('ስልክ ቁጥሮች'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('ቋንቋ ይምረጡ'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 100,
              height: 100,
              alignment: Alignment(-10.0, 10.0),
              padding: EdgeInsets.only(top: 200),
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: AssetImage('assets/moh.jpeg'))),
            )
          ],
        ),
      ),
    );
  }
}
