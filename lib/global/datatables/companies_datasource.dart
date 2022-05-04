import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/company/company.dart';
import 'package:provider/provider.dart';





class CompaniesDTS extends DataTableSource {

  final List<Company> company;
  final BuildContext context;

  CompaniesDTS(this.company, this.context);


  @override
  DataRow getRow(int index) {

    final categoria = company[index];
    
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell( Text( categoria.id ) ),
        DataCell( Text( categoria.fiscalName ) ),
        DataCell( Text( categoria.comercialName ) ),
        DataCell( Text( categoria.ruc ) ),
        DataCell( Text( categoria.phone ) ),
        DataCell( Text( categoria.contactEmail ) ),
        DataCell( Text( categoria.address ) ),
        DataCell( 
          Row(
            children: [
              IconButton(
                icon: Icon( Icons.edit_outlined ),
                onPressed: () {
                  print("Edit => " + categoria.id);
                  /*showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context, 
                      builder: ( _ ) => CategoryModal( categoria: categoria )
                  );*/
                }
              ),
              IconButton(
                icon: Icon( Icons.delete_outline, color: Colors.red.withOpacity(0.8)),
                onPressed: () {
                  print("Delete => " + categoria.id);
                  
                  final dialog = AlertDialog(
                    title: Text('¿Está seguro de borrarlo?'),
                    content: Text('¿Borrar definitivamente ${ categoria.fiscalName }?'),
                    actions: [
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Si, borrar'),
                        onPressed: () async {
                          /*await Provider.of<CategoriesProvider>(context, listen: false)
                            .deleteCategory(categoria.id);*/

                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );

                  showDialog(
                    context: context, 
                    builder: ( _ ) => dialog 
                  );


                }
              ),
            ],
          )
        ),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => company.length;

  @override

  int get selectedRowCount => 0;

}