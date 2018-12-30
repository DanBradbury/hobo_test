#define draw_test
/// draw_test()->int
draw_set_color(c_black);
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false);
draw_set_color(c_white);
draw_text(view_xview[0], 10, test_plan+test_lines+test_results);
return 0;

#define fail
/// fail(val:T)->int
description = argument[0];
TEST.result[TEST.test_count] = c_red;
TEST.fail_count += 1;
test_lines += "#not ok#";
test_lines += description;
return 0;

#define hobo_init
/// hobo_init()
x = 0; y = 0;
test_stack = ds_stack_create();
test_x = 0;
test_count = 0;
fail_count = 0;

test_plan = "1.."+string(test_count);
test_lines = "";
test_results = "";

#define instance_of
/// instance_of(val:T, val:T)->bool
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

#define it
/// it(val:T, val:T, val:T)-> bool
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

#define pass
/// pass()->int
/**
* Track that the test passed
*/
with(TEST)
{
  result[test_count] = c_green;
  test_lines += "#ok";
}

#define run_test
/// run_test()->int
/**
* Increment test counter and updated Draw related variables
* CALLED BEFORE A TEST PASSES/FAILS
*/
TEST.test_count += 1;
TEST.test_x += 60;
TEST.alarm[0] = 10;
return 0;
