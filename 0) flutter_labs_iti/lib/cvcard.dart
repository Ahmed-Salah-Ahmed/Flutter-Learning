import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CvCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.blue.shade300],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 8.0, right: 8.0),
                child: Text(
                  'Name: Ali Ziad',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Job Title: Software Engineer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
               Divider(
                color: Colors.white,
                thickness: 2.0,
                indent: 64.0,
                endIndent: 64.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
              child: MyListTile(
                icon: Icons.phone,
                text: 'Phone: (123) 456-7890',
                onTap: () => print('Hello from Phone'),
              ),
            ),
              MyListTile(
                icon: Icons.email,
                text: 'Email: ali.ziad@example.com',
                onTap: () => print('Hello from Email'),
              ),
              MyListTile(
                icon: Icons.code,
                text: 'GitHub: aliziad',
                onTap: () => print('Hello from GitHub'),
              ),
              MyListTile(
                icon: Icons.work,
                text: 'LinkedIn: aliziad',
                onTap: () => print('Hello from LinkedIn'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyListTile extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const MyListTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  _MyListTileState createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () async {
        if (widget.text.startsWith('GitHub:')) {
          final githubUsername = widget.text.split(': ')[1];
          final url = 'https://github.com/$githubUsername';
          await launch(url);
        } else if (widget.text.startsWith('LinkedIn:')) {
          final linkedInUsername = widget.text.split(': ')[1];
          final url = 'https://www.linkedin.com/in/$linkedInUsername';
          await launch(url);
        } else {
          widget.onTap();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isPressed ? Colors.grey.shade800 : Colors.grey.shade700.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          leading: Icon(widget.icon, color: Colors.white),
          title: Text(widget.text, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
