import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocfirebase/auth_bloc.dart';
import '../blocfirebase/auth_event.dart';
import '../blocfirebase/auth_state.dart';
import '../firebase_auth_repo.dart';
import 'home_page.dart';

class AuthPage extends StatelessWidget {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(FirebaseAuthRepo()),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Card(
                  color: Colors.white.withOpacity(0.95),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: BlocConsumer<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Bienvenidos',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: emailCtrl,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: "Correo Electronico",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(height: 16),
                            TextField(
                              controller: passwordCtrl,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                labelText: 'contaseña',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            if (state is AuthLoading)
                              CircularProgressIndicator()
                            else
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      context.read<AuthBloc>().add(
                                        LoginRequested(
                                          emailCtrl.text,
                                          passwordCtrl.text,
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.login),
                                    label: Text('Iniciar Sesion'),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      context.read<AuthBloc>().add(
                                        RegisterRequested(
                                          emailCtrl.text,
                                          passwordCtrl.text,
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.app_registration),
                                    label: Text('Registrar'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        );
                      },
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
                          );
                        } else if (state is AuthFailure) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(state.error)));
                        }
                      },
                    ),
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
