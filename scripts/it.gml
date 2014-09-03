ar = argument_count;
text = argument[0];

if(argument[1]==argument[2])
  {
    TEST.result[TEST.test_count] = c_green;
  }
else
  {
  TEST.result[TEST.test_count] = c_red;
  text += "#  EXPECTED: "+string(argument[1])+" WAS: "+string(argument[2]);
  TEST.failing_tests[TEST.fail_count] = text;
  fail_count += 1;
  }
//add_test_result()
TEST.test_count += 1;
TEST.test_x += 60;