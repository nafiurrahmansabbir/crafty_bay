import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 82),
                const AppLogoWidget(),
                const SizedBox(height: 24),
                Text(
                  'Complete Profile',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Get start with us with your details',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(hintText: 'First Name'),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                      ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _mobileTEController,
                  decoration: const InputDecoration(hintText: 'Mobile'),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                      ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your mobile number';
                    }
                    return null;

                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _cityTEController,
                  decoration: const InputDecoration(hintText: 'City'),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black45,
                      ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your city';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _shippingAddressTEController,
                  decoration:
                      const InputDecoration(hintText: 'Shipping Address'),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                      ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: 4,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter shipping address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //ToDo Valid hoile kaj koro nnaile muri khu
                      Get.offAll(()=>const MainBottomNavScreen());
                    }
                  },
                  child: const Text('Next'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shippingAddressTEController.dispose();
    super.dispose();
  }
}
