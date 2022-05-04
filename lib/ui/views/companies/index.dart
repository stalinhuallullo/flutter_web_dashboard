import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/global/datatables/companies_datasource.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/companies/companies_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/core/atoms/buttons/custom_icon_button.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/core/atoms/labels/custom_labels.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/layouts/modals/category_modal.dart';
import 'package:provider/provider.dart';



class CompaniesView extends StatefulWidget {
  const CompaniesView({Key? key}) : super(key: key);


  @override
  _CompaniesViewState createState() => _CompaniesViewState();
}

class _CompaniesViewState extends State<CompaniesView> {

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<CompaniesProvider>(context, listen: false).getCategories();

  }


  @override
  Widget build(BuildContext context) {

   
    final companies = Provider.of<CompaniesProvider>(context).companies;


    final columns = ['ID', 'Categoría', 'comercialName', 'ruc', 'phone', 'contactEmail', 'address', "Acciones"];

    return Container(
      padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Empresas', style: CustomLabels.h1 ),

          SizedBox( height: 10 ),

          PaginatedDataTable(
              columns: getColumns(columns), 
              source: CompaniesDTS( companies, context ),
              header: Text('Empresas disponibles', maxLines: 2 ),
              onRowsPerPageChanged: ( value ) {
                setState(() {
                  _rowsPerPage = value ?? 10;
                });
              },
              rowsPerPage: _rowsPerPage,
              showCheckboxColumn: false,
              actions: [
                CustomIconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled:true,
                      //isDismissible: true,
                      backgroundColor: Colors.transparent,
                      context: context, 
                      builder: ( _ ) => CompanyModal(company: null)
                    );
                  }, 
                  text: 'Crear', 
                  icon: Icons.add_outlined,
                )
              ],
            )

        ],
      ),
    );
  }


  List<DataColumn> getColumns(List<String> columns) => 
    columns
      .map( (column) => DataColumn( label: Text(column) ) ).toList();
}