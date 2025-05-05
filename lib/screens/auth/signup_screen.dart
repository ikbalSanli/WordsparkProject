
import 'package:flutter/material.dart';
import 'package:wordspark/components/auth_textfield.dart';
import 'package:wordspark/model/user_model.dart';
import 'package:wordspark/service/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  
  String selectedGender = 'Belirtilmedi';
  DateTime? selectedBirthDate;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.deepPurple),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedBirthDate = picked;
      });
    }
  }

  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) return;
    if (selectedBirthDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen doğum tarihinizi seçin')),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final userModel = UserModel(
        id: '',
        email: emailController.text.trim(),
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        gender: selectedGender,
        birthDate: selectedBirthDate!,
      );

      await _authService.registerUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        userModel: userModel,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Kayıt başarılı!"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacementNamed(context, "/");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Kayıt hatası: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),
                      const Hero(
                        tag: 'registerIcon',
                        child: Icon(
                          Icons.person_add_outlined,
                          size: 80,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Hesap Oluştur',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      CustomTextField(
                        controller: firstNameController,
                        label: "Ad",
                        icon: Icons.person_outline,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Ad alanı boş bırakılamaz';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: lastNameController,
                        label: "Soyad",
                        icon: Icons.person_outline,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Soyad alanı boş bırakılamaz';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: emailController,
                        label: "E-posta",
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'E-posta alanı boş bırakılamaz';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value!)) {
                            return 'Geçerli bir e-posta adresi giriniz';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: passwordController,
                        label: "Şifre",
                        icon: Icons.lock,
                        isObscure: true,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Şifre alanı boş bırakılamaz';
                          }
                          if (value!.length < 6) {
                            return 'Şifre en az 6 karakter olmalıdır';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButtonFormField<String>(
                            value: selectedGender,
                            decoration: const InputDecoration(
                              labelText: "Cinsiyet",
                              labelStyle: TextStyle(color: Colors.deepPurple),
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.deepPurple),
                              border: InputBorder.none,
                            ),
                            items: ['Belirtilmedi', 'Kadın', 'Erkek', 'Diğer']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGender = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.calendar_today, color: Colors.deepPurple),
                          title: Text(
                            selectedBirthDate == null
                                ? 'Doğum Tarihi Seçin'
                                : '${selectedBirthDate!.day}/${selectedBirthDate!.month}/${selectedBirthDate!.year}',
                            style: TextStyle(
                              color: selectedBirthDate == null
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                          onTap: () => _selectDate(context),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: isLoading ? null : registerUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                "Kayıt Ol",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                        child: const Text(
                          "Zaten bir hesabınız var mı? Giriş Yap",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}