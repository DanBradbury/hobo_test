while(!ds_stack_empty(test_stack))
  {
    test = ds_stack_pop(test_stack);
    it(test[0],test[1],test[2]);
    run_test_stack();
  }