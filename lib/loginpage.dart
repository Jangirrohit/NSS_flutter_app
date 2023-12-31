import 'package:flutter/material.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage("xyz4.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.8), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 80, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image(
          //   image: AssetImage("xyz1.jpg"),
          //   width: 500,
          // ),
          // Text(
          //   "NSS",
          //   style: TextStyle(
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 40,
          //       letterSpacing: 2),
          // )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    DecoratedBox(decoration: BoxDecoration(color: Colors.green[100]));
    return SizedBox(
        width: mediaSize.width,
        child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: _buildForm(),
            )));
  }

  // Widget _buildForm() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         "Welcome",
  //         style: TextStyle(
  //             color: Color.fromARGB(248, 19, 66, 137),
  //             fontSize: 32,
  //             fontWeight: FontWeight.w500),
  //       ),
  //       _buildGreyText(
  //         "Please login with your information",
  //       ),
  //       const SizedBox(height: 50),
  //       _buildGreyText("Email address"),
  //       _buildInputField(emailController),
  //       const SizedBox(height: 30),
  //       _buildGreyText("Password"),
  //       _buildInputField(passwordController, isPassword: true),
  //       const SizedBox(height: 20),
  //       _buildRememberForgot(),
  //       const SizedBox(height: 20),
  //       _buildLoginButton(),
  //       const SizedBox(height: 20),
  //       _buildOtherLogin(),
  //     ],
  //   );
  // }
  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome",
          style: TextStyle(
              color: Color.fromARGB(248, 19, 66, 137),
              fontSize: 32,
              fontWeight: FontWeight.w500),
        ),
        _buildGreyText(
          "Please login with your information",
        ),
        const SizedBox(height: 50),
        _buildGreyText("Email address"),
        _buildInputField(emailController),
        const SizedBox(height: 30),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),

        _buildLoginButton(),
        const SizedBox(height: 20),

        // Add a button to navigate to the registration page
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegistrationPage(),
              ),
            );
          },
          child: const Text('Register'),
        ),

        _buildOtherLogin(),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon:
            isPassword ? const Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
            onPressed: () {}, child: _buildGreyText("I forgot my password"))
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Email : ${emailController.text}");
        debugPrint("Password : ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
        backgroundColor: Color.fromARGB(248, 19, 66, 137),
      ),
      child: const Text("LOGIN"),
    );
  }

  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          _buildGreyText("Or Login with"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(icon: Image.asset("assets/google.png")),
              Tab(icon: Image.asset("github.png")),
              Tab(
                  icon: Image.network(
                      "https://th.bing.com/th/id/OIP.lP3ZKEQTnezleNemx3OvbgHaHa?pid=ImgDet&rs=1"))
            ],
          )
        ],
      ),
    );
  }
}
