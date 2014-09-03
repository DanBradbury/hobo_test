found = true;
for(i=0;i<argument_count;i++)
  {
  a[0] = "should exist"+string(argument[i]);
  a[1] = true;
  a[2] = instance_exists(argument[i]);
  ds_stack_push(test_stack, a );
  run_test_stack();
  }
