import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';

class BuildDropDown extends StatelessWidget {
  final void Function(dynamic)  onSelectItem;
  final List<String> items;
  final String selectedItem;
  final String category;
  final double widthSize;
  final String assetPrefixIcon;
  final Widget dropDownWidget;
   

  const  BuildDropDown({Key key, 
  this.onSelectItem, this.items, 
  this.selectedItem, this.category, this.widthSize, this.assetPrefixIcon, this.dropDownWidget}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      // color: Colors.red,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 0, right: 4),
        alignment: Alignment.center,
       
        // height: 55,
        // width: widthSize,
        // MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                 
                  children: [
                     Padding(
                       padding: const EdgeInsets.all(7 ),
                       child: new Image.asset(
                        assetPrefixIcon,
                         width: 30.0,
                         height: 30,
                         // fit: BoxFit.cover,
                       ),
                     ),
                    // SizedBox(width:8),
                  
                    selectedItem == null
                    ? Flexible(
                        fit: FlexFit.loose,
                        child: Text(category,
                        style: TextStyle(
                          fontSize: 13,
                          color: MyTheme.grey,
                          fontWeight: FontWeight.bold)
                        ),
                      )
                    : Flexible(
                        fit: FlexFit.loose,
                        child: Text(selectedItem,
                          style: TextStyle(
                          fontSize: 13,
                          color: MyTheme.grey,
                          fontWeight: FontWeight.bold)
                          ),
                      ),
                    ],
                ),
              ),dropDownWidget
              // Container(
              //   color: Colors.red,
                
              //    width: 20,
              //   child: DropdownButton<String>(
              //   //  isDense:true,
              //     underline: Container(),
              //     dropdownColor: Colors.white,
              //     icon: Icon(
              //       Icons.arrow_drop_down,
              //       color: Colors.grey,
              //     ),
              //     items: items.map((String value) {
              //       return new DropdownMenuItem<String>(
              //         value: value,
              //         child: new Text(value),
                          
              //       );
              //     }).toList(),
                  // onChanged:onSelectItem
              //   ),
              // )
              // 
              // 
              
              
               
              // 
              // 
              // IconButton(
              //   onPressed: (){
              //     _showPopupMenu(context);
                  
              //   },
              //   icon: Icon(Icons.arrow_drop_down))
          ],
        ),
      ),
    );
  }

   void _showPopupMenu(BuildContext context) async {
      await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(200, 200, 200, 500),
        items: [
          PopupMenuItem(
            value: "Female", 
            child: Text("Female"),
          ),
          PopupMenuItem(
             value: "Male",
            child: Text("Male"),
          ),
         
        ],
        elevation: 8.0,
      ).then((value){

      if(value!=null)
       print(value);

       });
    }
}


