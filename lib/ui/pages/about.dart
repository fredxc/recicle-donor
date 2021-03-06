import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  _launchURL() async {
    const url = 'https://recicle.web.app/download/donor_policy.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SOBRE"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          margin: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.0),
                  topRight: Radius.circular(6.0),
                ),
                child: Image.asset(
                  'assets/about.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 8),
                  Column(
                    children: <Widget>[
                      Text(
                        "DESENVOLVEDORES",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          "Bruno Pereira Campos, Frederico Xavier Capanema e Kariny Alves Almeida",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Column(
                    children: <Widget>[
                      Text(
                        "SOBRE",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          "O projeto Recicle+ ?? uma iniciativa da Associa????o Lixo e Cidadania em parceiria "
                          "com o CEFET-MG Campus V. Com o desenvolvimento do sistema foi poss??vel aplicar "
                          "os conhecimentos do grupo em uma causa nobre, que ?? a coleta sustent??vel. Os "
                          "aplicativos visam conectar aqueles que desejam reciclar com os coletores de "
                          "res??duos recicl??veis, facilitando o processo como um todo.",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.0),
                  GestureDetector(
                    child: Text(
                      "Pol??tica de Privacidade",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      _launchURL();
                    },
                  ),
                  SizedBox(height: 12.0),
                ],
              ),
            ],
          ),
          elevation: 2.0,
        ),
      ),
    );
  }
}
