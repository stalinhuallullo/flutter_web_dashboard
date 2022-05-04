import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/global/constants/style.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/auth_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/login_form_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/core/atoms/buttons/custom_outlined_button.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/core/atoms/inputs/custom_inputs.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/core/atoms/texts/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
print("login");
    final authProvider = Provider.of<AuthProvider>(context);
    
    return ChangeNotifierProvider(
      create: ( _ ) => LoginFormProvider(),
      child: Builder(builder: ( context ){

        final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);


        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric( horizontal: 20 ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints( maxWidth: 370 ),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: loginFormProvider.formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Image.asset("assets/icons/logo.png"),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Text("Iniciar sesión", style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CustomText(
                          text: "Bienvenido de nuevo al panel de administración.",
                          color: lightGrey,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // Email
                    TextFormField(
                      onFieldSubmitted: ( _ ) => onFormSubmit( loginFormProvider, authProvider ),
                      validator: ( value ) {
                        //if( !EmailValidator.validate(value ?? '') ) return 'Email no válido';
                        if ( value == null || value.isEmpty ) return 'Ingrese su nombre de usuario';
                        if ( value.length < 6 ) return 'El nombre de usuario debe de ser de 6 caracteres';

                        return null;
                      },
                      onChanged: ( value ) => loginFormProvider.username = value,
                      style: TextStyle( color: whiteOpacity06 ),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: '',
                        label: 'Nombre de usuario',
                        icon: Icons.email_outlined
                      ),
                    ),

                    const SizedBox( height: 20 ),

                    // Password
                    TextFormField(
                      onFieldSubmitted: ( _ ) => onFormSubmit( loginFormProvider, authProvider ),
                      onChanged: ( value ) => loginFormProvider.password = value,
                      validator: ( value ) {
                        if ( value == null || value.isEmpty ) return 'Ingrese su contraseña';
                        if ( value.length < 4 ) return 'La contraseña debe de ser de 6 caracteres';

                        return null; // Válido
                      },
                      obscureText: true,
                      style: TextStyle( color: whiteOpacity06 ),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: '',
                        label: 'Contraseña',
                        icon: Icons.lock_outline_rounded
                      ),
                    ),
                    
                    const SizedBox( height: 20 ),
                    CustomOutlinedButton(
                      onPressed: () => onFormSubmit( loginFormProvider, authProvider ), 
                      text: 'Ingresar',
                    ),

                  ],
                )
              ),
            ),
          ),
        );
      })
    );
  }

  void onFormSubmit(LoginFormProvider loginFormProvider, AuthProvider authProvider ) {
    final isValid = loginFormProvider.validateForm();
    if ( isValid ) authProvider.login(loginFormProvider.username, loginFormProvider.password);
  }

}