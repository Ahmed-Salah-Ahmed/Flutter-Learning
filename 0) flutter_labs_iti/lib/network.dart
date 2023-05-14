import 'package:flutter/material.dart';
class Network extends StatelessWidget {
  const Network({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9575cd),
        title: const Text("New News"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                "https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://img.freepik.com/free-vector/igloo-ice-with-flag-cartoon-vector-icon-illustration-building-nature-icon-concept-isolated-premium_138676-7719.jpg?w=740&t=st=1680434406~exp=1680435006~hmac=4d775bdb8cae4f982143e1b5932aab5c9ed7844d8e8360791985b4d9df829f7d"),
                          fit: BoxFit.fitHeight)),
                  width: 100,
                  height: 100,
                  margin: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 16),
                ),
                const Text(
                  "Instructor",
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
            const Text(
              " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in elementum quam. Integer pellentesque vulputate sapien, nec volutpat felis tristique quis. Vestibulum eu tortor in elit aliquet ornare. Proin rutrum scelerisque fermentum. Duis vel volutpat nulla. Suspendisse sem turpis, sodales ac ante ac, blandit luctus libero. Quisque condimentum ex ipsum, sed egestas mauris aliquet non. Vestibulum justo leo, hendrerit quis nisl sit",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff9575cd),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.heart_broken_rounded,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Transform.rotate(
                angle: 180 * 3.1415926535 / 180,
                child: const RotatedBox(
                  quarterTurns: 0,
                  child: Icon(Icons.message_rounded),
                ),
              ),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.share),
              label: "",
            )
          ]),
    );
  }
}
