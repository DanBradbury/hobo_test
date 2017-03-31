/**
* Is an element a given object type
*
* object - object type to check against
* element - element to verify is of correct object type
*
* Example:
* instance_of(o_tile, map[0,2])
* => false
*/

object = argument[0];
element = argument[1];

found = false;

for(i=0;i<instance_number(object)-1;i++)
  {
    o_id = instance_find(object, i);
    if(o_id == element)
      {
        return true;
      }
  }
  
return false;