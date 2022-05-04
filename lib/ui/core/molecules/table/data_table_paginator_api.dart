import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/core/atoms/buttons/button_icon_circle.dart';


class DataTablePaginatorApi extends StatefulWidget {
  
  final List<dynamic> users;
  final List<String> columns;
  final int sortColumnIndex;
  final bool? isAscending;
  final Function onPressedEdit;
  final Function onPressedRemove;
  final Function onPressedAdd;


  const DataTablePaginatorApi({
    Key? key,
    required this.users,
    required this.columns,
    required this.sortColumnIndex,
    this.isAscending = false,
    required this.onPressedEdit,
    required this.onPressedRemove,
    required this.onPressedAdd,
  }) : super (key: key);

  @override
  State<DataTablePaginatorApi> createState() => _DataTablePaginatorApiState();
}

class _DataTablePaginatorApiState extends State<DataTablePaginatorApi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildDataTable(),
    );
  }

  Widget buildDataTable() {
    print("=== users ===");
    print(widget.users);
    //final columns = ['rol', 'estado', 'google', 'nombre', 'correo', 'uid', 'img', "Opciones"];

    return Container(
      child: DataTable(
        sortAscending: widget.isAscending ?? false,
        sortColumnIndex: widget.sortColumnIndex,
        columns: getColumns(widget.columns),
        rows: getRows(),
      )
    );
  }

  /*Widget buildDataTable() {
    final columns = ['First Name', 'Last Name', 'Age'];

    return Container(
      child: DataTable(
        sortAscending: isAscending,
        sortColumnIndex: sortColumnIndex,
        columns: [
                DataColumn2(
                  label: Text("Name")
                ),
                DataColumn2(
                  label: Text("Name")
                ),
                DataColumn2(
                  label: Text("Name")
                ),
                DataColumn2(
                  label: Text("Name")
                ),
                DataColumn2(
                  label: Text("Name")
                ),
                ],
        rows: List<DataRow>.generate(
              100,
              (index) => DataRow(cells: [
                    DataCell(Text('A' * (10 - index % 10))),
                    DataCell(Text('B' * (10 - (index + 5) % 10))),
                    DataCell(Text('C' * (15 - (index + 5) % 10))),
                    DataCell(Text('D' * (15 - (index + 10) % 10))),
                    DataCell(Text(((index + 0.1) * 25.4).toString()))
                  ])),
      )
    );
  }*/
  List<DataColumn2> getColumns(List<String> columns) => columns
    .map((column) => DataColumn2(
                  label: Text(column),
    )).toList();

  List<DataRow> getRows() => widget.users
    .map((user) {

      final cells = [];
      final obj = user.toMap();
      String uid = "";

      for (String key in  obj.keys){
        if(key == "uid") { uid = obj[key]; }
        cells.add(obj[key]);
      }

      //final cells = [user.rol, user.estado, user.google, user.nombre, user.correo, user.uid, user.img];
      return DataRow(cells: getCells(cells, uid));
    }).toList();

  List<DataCell> getCells(List<dynamic> cells, String uid) {
    List<DataCell> cell =  cells.map( (data) => DataCell( Text(data) ) ).toList();
    cell.add(
      DataCell(
        Container(
          child: Row(
            children: [
              ButtonIconCircle( nameIcon: "edit", color: Colors.blue, onPressed: () => { widget.onPressedEdit(uid) } ),
              ButtonIconCircle( nameIcon: "remove", color: Colors.red, onPressed: () => { widget.onPressedRemove(cells[0]) } ),
              ButtonIconCircle( nameIcon: "add", color: Colors.green, onPressed: () => { widget.onPressedAdd(cells[0]) } ),
            ],
          ),
        )
      )
    );
    return cell;
  }

  void onSort(int columnIndex, bool ascending) {
      if (columnIndex == 0) {
        widget.users.sort((user1, user2) =>
            compareString(ascending, user1.rol, user2.rol));
      } else if (columnIndex == 1) {
        widget.users.sort((user1, user2) =>
            compareString(ascending, user1.nombre, user2.nombre));
      } else if (columnIndex == 2) {
        widget.users.sort((user1, user2) =>
            compareString(ascending, '${user1.correo}', '${user2.correo}'));
      }

      setState(() {
        //widget.sortColumnIndex = columnIndex ?? 0;
        //widget.isAscending = ascending;
      });
    }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
