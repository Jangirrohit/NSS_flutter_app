import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController =
      TextEditingController(); // Add email controller
  TextEditingController passwordController =
      TextEditingController(); // Add password controller
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: AssetImage("xyz4.jpg"), // Replace with your image asset
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.8), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Add any widgets or text you want for the top section here
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Registration",
          style: TextStyle(
            color: Color.fromARGB(248, 19, 66, 137),
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        _buildGreyText("Please fill in your information"),
        const SizedBox(height: 20),
        _buildGreyText("Full Name"),
        _buildInputField(fullNameController),
        const SizedBox(height: 20),
        _buildGreyText("Phone Number"),
        _buildInputField(phoneNumberController),
        const SizedBox(height: 20),
        _buildGreyText("Email address"), // Add email field label
        _buildInputField(emailController), // Add email field
        const SizedBox(height: 20),
        _buildGreyText("Password"), // Add password field label
        _buildInputField(passwordController,
            isPassword: true), // Add password field
        const SizedBox(height: 20),
        _buildRegisterButton(),
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

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement your registration logic here
        String fullName = fullNameController.text;
        String phoneNumber = phoneNumberController.text;
        String email = emailController.text; // Retrieve email
        String password = passwordController.text; // Retrieve password

        // Perform user registration
        // If successful, navigate to the logged-in page or perform other actions
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        minimumSize: const Size.fromHeight(60),
        backgroundColor: Color.fromARGB(248, 19, 66, 137),
      ),
      child: const Text("REGISTER"),
    );
  }
}
