import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String gender = "Male";
  DateTime? selectedDate;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdateController = 
    TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> selectBirthdate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;

        birthdateController.text =
            "${date.day.toString().padLeft(2, '0')}/"
            "${date.month.toString().padLeft(2, '0')}/"
            "${date.year}";
      });
    }
  }
  void register() {
  if (nameController.text.isEmpty ||
      birthdateController.text.isEmpty ||
      mobileController.text.isEmpty ||
      emailController.text.isEmpty ||
      passwordController.text.isEmpty ||
      confirmPasswordController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please fill all the fields."),
      ),
    );
    return;
  }

  if (passwordController.text != confirmPasswordController.text) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Passwords do not match."),
      ),
    );
    return;
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Registration Completed"),
        content: const Text(
          "Registration completed.\nNow you can LOGIN.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "OK",
              style: TextStyle(
                color: Colors.lightBlue,
              ),
            ),
          ),
        ],
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          "Register",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Center(
              child: Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Name
            const Text(
              "Name",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter your name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Gender
            const Text(
              "Gender",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),

            Row(
              children: [

                Radio<String>(
                  value: "Male",
                  groupValue: gender,
                  activeColor: Colors.lightBlue,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),

                const Text("Male"),

                Radio<String>(
                  value: "Female",
                  groupValue: gender,
                  activeColor: Colors.lightBlue,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),

                const Text("Female"),

                Radio<String>(
                  value: "Other",
                  groupValue: gender,
                  activeColor: Colors.lightBlue,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),

                const Text("Other"),
              ],
            ),

            const SizedBox(height: 10),

            // Birthdate
            const Text(
              "Birthdate",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: birthdateController,
              readOnly: true,
              onTap: selectBirthdate,

              decoration: InputDecoration(
                hintText: "01/01/2026",
                suffixIcon: const Icon(
                  Icons.calendar_month,
                  color: Colors.lightBlue,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Mobile Number
            const Text(
              "Mobile No.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter mobile number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Email
            const Text(
              "Email",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Password
            const Text(
              "Password",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Confirm Password
            const Text(
              "Confirm Password",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Confirm password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Register Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "REGISTER",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
