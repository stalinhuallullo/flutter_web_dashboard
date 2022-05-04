import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/global/constants/style.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/company/company.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/companies/companies_form_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/companies/companies_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/global/services/notifications_service.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/core/atoms/buttons/custom_outlined_button.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/core/atoms/inputs/custom_inputs.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/core/atoms/labels/custom_labels.dart';
import 'package:provider/provider.dart';




class CompanyModal extends StatefulWidget {

  final Company? company;

  const CompanyModal({
    Key? key, 
    this.company
  }) : super(key: key);

  @override
  _CompanyModalState createState() => _CompanyModalState();
}

class _CompanyModalState extends State<CompanyModal> {

  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();

    id     = widget.company?.id;
    //nombre = widget.company?.nombre ?? '';

  }


  @override
  Widget build(BuildContext context) {


    //final companiesProvider = Provider.of<CompaniesProvider>(context, listen: false);
    final companiesFormProvider = Provider.of<CompaniesFormProvider>(context, listen: false);
    List<EstateRoom> scopeList = [
      EstateRoom(false, "Read"),
      EstateRoom(false, "Write")
    ];

    List<EstateRoom> typeAutorizationList = [
      EstateRoom(false, "password"),
      EstateRoom(false, "authorization_code"),
      EstateRoom(false, "refresh_token"),
      EstateRoom(false, "implicit")
    ];
    return Container(
      
      padding: EdgeInsets.all(20),
      height: 800,
      width: 300, // expanded
      decoration: buildBoxDecoration(),
      child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: companiesFormProvider.formKey,
            child: Column(
              children: [
                  
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( 
                      widget.company?.comercialName ?? 'Nueva empresa', 
                      style: CustomLabels.h1.copyWith( color: Colors.white )
                    ),
                    IconButton(
                      icon: Icon( Icons.close, color: Colors.white, ), 
                      onPressed: () => Navigator.of(context).pop()
                    )
                  ],
                ),

               Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.red,
                  child: const Text("Item 1"),
                ),
              ),

                
                Container(
                  decoration: BoxDecoration( color: Colors.green),
                  child: 
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height - 600,
                        decoration:  BoxDecoration(color: Colors.red),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("tAYLOR")
                          ],
                        ),  
                      ),
                    ),
                ),
                
                
                
                
                
                
                
                  
                Container(
                  margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: CustomOutlinedButton(
                    onPressed: () async{
                      onFormSubmit(companiesFormProvider);
                    },
                    text: 'Guardar',
                    color: Colors.white,
                  ),
                )
                  
              ],
            ),
                  ),
    );
  }

  void onFormSubmit(CompaniesFormProvider formProvider) async{
    final isValid = await formProvider.registerCompany();

    if ( isValid ) print("Se registro con exito");
    else print("No se registro");
      //authProvider.login(loginFormProvider.email, loginFormProvider.password);*/

    /*try {
      if( id == null ) {
        // Crear
        //await categoryProvider.newCategory(nombre);
        NotificationsService.showSnackbar('$nombre creado!');

      } else {
        // Actualizar
        //await categoryProvider.updateCategory( id!, nombre );
        NotificationsService.showSnackbar('$nombre Actualizado!');
      }

      Navigator.of(context).pop();

    } catch (e) {
      Navigator.of(context).pop();
      NotificationsService.showSnackbarError('No se pudo guardar la categoría');
    }*/
  }


  BoxDecoration buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.only( topLeft:  Radius.circular(20), topRight: Radius.circular(20) ),
    color: Color(0xff0F2041),
    boxShadow: [
      BoxShadow(
        color: Colors.black26
      )
    ]
  );
}

class EstateRoom {
  bool? isSelected = false;
  String name;

  EstateRoom(this.isSelected, this.name);
}



