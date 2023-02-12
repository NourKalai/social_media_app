import 'package:diginas_app/authentification/screens/home/widgets/appbar_simple.dart';
import 'package:diginas_app/authentification/screens/home/widgets/circle_button.dart';
import 'package:diginas_app/constant/provider/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
  static const keyDarkMode = 'key-dark-mode';
}

class _SettingsPageState extends State<SettingsPage> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      return e;
    }
  }

  static const keyDarkMode = 'key-dark-mode';

  static const keyLanguage = "key-language";
  static const keyPassword = 'key-password';
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: const AppBarSimple(title: "Settings"),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Column(children: [
            Stack(children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/nan.png',
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 0,
                  right: 4,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(2, 4),
                              color: const Color.fromARGB(255, 250, 246, 246)
                                  .withOpacity(
                                0.3,
                              ),
                              blurRadius: 3,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 13,
                          child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => BottomSheet(context)),
                                );
                              },
                              child: const Icon(Icons.edit)),
                        ),
                      )))
            ]),
          ]),
          const SizedBox(height: 30),
          SettingsGroup(title: 'GENERAL', children: <Widget>[
            const SizedBox(height: 10),
            SimpleSettingsTile(
              title: 'Account Settings',
              subtitle: 'Privacy,Security,Language',
              leading: CircleButton(
                  backgroundcolor: Colors.white,
                  icon: Icons.person,
                  color: Colors.green,
                  onPressed: () {}),
              child:
                  SettingsScreen(title: 'Account Settings', children: <Widget>[
                DropDownSettingsTile(
                  title: "Language",
                  settingKey: keyLanguage,
                  selected: 1,
                  values: const <int, String>{
                    1: "English",
                    2: "Arabic",
                    3: "French",
                    4: "Spanish",
                    5: "Deutsh",
                  },
                  onChange: (language) {},
                ),
                TextInputSettingsTile(
                    title: 'Password',
                    settingKey: keyPassword,
                    obscureText: true,
                    validator: (password) =>
                        password != null && password.length > 4
                            ? null
                            : "Enter a valid password"),
                SimpleSettingsTile(
                  title: 'Privacy',
                  leading: CircleButton(
                      backgroundcolor: Colors.white,
                      icon: Icons.lock,
                      color: Colors.blue,
                      onPressed: () {}),
                ),
                SimpleSettingsTile(
                  title: 'Security',
                  leading: CircleButton(
                      backgroundcolor: Colors.white,
                      icon: Icons.security,
                      color: Colors.orange,
                      onPressed: () {}),
                ),
                SimpleSettingsTile(
                  title: 'Account Info',
                  leading: CircleButton(
                      backgroundcolor: Colors.white,
                      icon: Icons.description,
                      color: Colors.purple,
                      onPressed: () {}),
                ),
              ]),
            ),
            SwitchSettingsTile(
              leading: CircleButton(
                  backgroundcolor: Colors.white,
                  icon: Icons.dark_mode,
                  color: Colors.blue.shade900,
                  onPressed: () {}),
              defaultValue: themeProvider.isDarkMode,
              title: 'Dark Mode',
              settingKey: keyDarkMode,
              onChange: (value) {
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                provider.toggleTheme(value);
              },
            ),
            const SizedBox(height: 10),
            SimpleSettingsTile(
              title: 'Desactivate Account',
              leading: CircleButton(
                  backgroundcolor: Colors.white,
                  icon: Icons.delete,
                  color: Colors.red,
                  onPressed: () {}),
            )
          ]),
          const SizedBox(height: 10),
          SettingsGroup(title: 'FEEDBACK', children: <Widget>[
            const SizedBox(height: 10),
            SimpleSettingsTile(
              title: 'Report A Bug',
              leading: CircleButton(
                  backgroundcolor: Colors.white,
                  icon: Icons.bug_report,
                  color: Colors.teal,
                  onPressed: () {}),
            ),
            const SizedBox(height: 10),
            SimpleSettingsTile(
              title: 'Send Feedback',
              leading: CircleButton(
                  backgroundcolor: Colors.white,
                  icon: Icons.thumb_up_alt,
                  color: Colors.purple,
                  onPressed: () {}),
            ),
          ])
        ],
      )),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: [
        const Text(
          "Choose your profile picture",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                icon: const Icon(
                  Icons.camera,
                  color: Colors.green,
                ),
                label: const Text("Camera",
                    style: TextStyle(color: Colors.black))),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.photo,
                  color: Colors.green,
                ),
                label: const Text(
                  "Galerie",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        )
      ]),
    );
  }
}
