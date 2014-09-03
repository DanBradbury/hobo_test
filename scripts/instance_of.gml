object = argument[0];
found = false;

for(i=0;i<instance_count -1;i++)
  {
    o_id = instance_find(object, i);
    if(o_id == argument[1])
      {
        return true;
      }
  }
  
return false;