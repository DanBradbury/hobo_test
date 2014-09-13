/**
* Test actual value against expected value with a description of the test
* 
* description - a short statement of what is being tested
* expected - the value that is expected of the system
* actual - the actual state of the system
*
* Example:
* it("should not be drawing movement on create", false, draw_movement);  
* => false
*/

ar = argument_count;
description = argument[0];
expected = argument[1];
actual = argument[2]

run_test();

if(expected==actual)
  {
  pass();
  }
else
  {
  description += "#  EXPECTED: "+string(expected)+" WAS: "+string(actual);
  TEST.failing_tests[TEST.fail_count] = description;
  fail(description);
  }