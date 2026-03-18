import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../controllers/admin_controller/add_resturant_controller.dart';
import 'package:get/get.dart';
class Fetchresturants extends StatefulWidget {
  const Fetchresturants({super.key});

  @override
  State<Fetchresturants> createState() => _FetchresturantsState();
}

class _FetchresturantsState extends State<Fetchresturants> {
  final AddRestaurantController controll = Get.put(AddRestaurantController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder (stream: Supabase.instance.client.from('resturants').stream(primaryKey: ['id']),
        builder: (context, snapshot) {
          final alldata=snapshot.data??[];
          if(snapshot.connectionState==ConnectionState.waiting){
            return Column(
              mainAxisAlignment: .center,
              children: [
              Center(child: CircularProgressIndicator(color: Colors.blue,
                backgroundColor: Colors.blue.shade100,))

              ],
            );
          }
          else {
            return Expanded(
              child: ListView.builder(
                itemCount: alldata.length,
                itemBuilder: (context, index) {
                  final currentdata=alldata[index];
                  return Padding(
                    padding: EdgeInsetsGeometry.only(left: 10,right: 10,bottom: 10),
                    child: Card(
                        elevation: 5,
                        color: Colors.grey.shade200,
                        child: ListTile(

                          contentPadding: EdgeInsets.all(15),
                          leading: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(15),
                              child: Image.network('${currentdata['image_url']}',height: 140,width: 80,fit: BoxFit.cover,)),
                          title: Text('${currentdata['name'].toString().toUpperCase()}'
                            ,style: GoogleFonts.playfairDisplay(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),),
                          subtitle: Text('${currentdata['category']}'),
                          trailing: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusGeometry.circular(10),
                                color: Colors.red.shade100,
                                border: Border.all(
                                    color: Colors.red
                                )
                            ),
                            child: IconButton(onPressed: ()=>controll.deleteRestaurant(currentdata['id'].toString()),
                                icon: Icon(Icons.delete_outline,color: Colors.red,size: 30,)),
                          ),
                        )),
                  );
                },),
            );
          }

        });
  }
}
