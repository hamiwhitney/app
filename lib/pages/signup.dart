import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:splash/pages/otp.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Ease the way you pay your bills.",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 24),
              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              SizedBox(height: 16),
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your mobile number',
                ),
                initialCountryCode: 'NG', // Default country code (Nigeria)
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              SizedBox(height: 16),
              FormBuilderTextField(
                name: 'password',
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(6),
                ]),
              ),
              SizedBox(height: 8),
              FormBuilderCheckbox(
                name: 'terms',
                initialValue: false,
                onChanged: (value) {},
                title: Row(
                  children: [
                    Text("I agree to the "),
                    GestureDetector(
                      onTap: () {
                        // Handle terms & conditions navigation
                      },
                      child: Text(
                        "terms and conditions",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                validator: FormBuilderValidators.equal(
                  
                  true,
                  errorText: 'You must accept terms and conditions to proceed',
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
  onPressed: () {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      // Process data and verify user
      print(_formKey.currentState?.value);
      
      // Navigate to the OTP verification screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpVerificationScreen(),
        ),
      );
    } else {
      print("Validation failed");
    }
  },
  style: ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 50), // Full-width button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    backgroundColor: const Color(0xFF009156), // Green color
  ),
  child: Text(
    'Sign Up',
    style: TextStyle(fontSize: 18, color: Colors.white),
  ),
),
              SizedBox(height: 16),
              // ElevatedButton.icon(
              //   onPressed: () {
              //     // Handle Google sign-up
              //   },
              //   icon: Icon(Icons.login),
              //   label: Text('Sign Up with Google'),
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: Size(double.infinity, 50),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(25.0),
              //     ),
              //     backgroundColor: Colors.white, // White background color
              //     foregroundColor: Colors.black, // Text and icon color
              //     side: BorderSide(color: Colors.grey), // Border color
              //   ),
              // ),
              // SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle login navigation
                  },
                  child: Text(
                    "Already a member? Log In",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
