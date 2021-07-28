
class Task{
  int id;

String name;

int number;
 taskMap(){
   var mapping =Map<String, dynamic>();
   mapping['id']=id;
   mapping['name']=name;
   mapping['number']=number;
   return mapping;
 }


}