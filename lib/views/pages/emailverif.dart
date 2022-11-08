part of 'pages.dart';

class Emailverif extends StatefulWidget {
  const Emailverif({ Key? key }) : super(key: key);

  @override
  _EmailverifState createState() => _EmailverifState();
}

class _EmailverifState extends State<Emailverif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification Success!"),
      ),
      body: const Center(
        child: const Text("Congratulation you've succeed verifiying your email address !"),
      ),
    );
  }
}