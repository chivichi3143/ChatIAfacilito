import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatfacilito',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.80,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Text(
                      'Log in in to ChatFacilito',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome back! Sign in using your social account or email to continue us',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 146, 146, 147)), // Opcional, para cambiar el color del texto
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black, width: 1.0)),
                    child: Image.asset(
                      'assets/images/google.png',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey, // Color de la línea
                            thickness: 1, // Grosor de la línea
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'OR',
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey, // Color de la línea
                            thickness: 1, // Grosor de la línea
                          ),
                        ),
                      ],
                    ),
                  ),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email', hintText: 'Enter your email', border: UnderlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password', hintText: 'Enter your password', border: UnderlineInputBorder()),
                  ),

                  
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: null,
                                child: Text(
                                  'Log in',
                                  style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Forgot password?",
                          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
