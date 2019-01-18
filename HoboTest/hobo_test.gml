#define draw_test
/// draw_test()->int
draw_set_alpha(0.3);
draw_set_color(c_black);
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false);
draw_set_alpha(1);
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
global.__simulate_click = external_define("hobo_dll.dll", "simulate_click", dll_stdcall, ty_real, 0);
x = 0; y = 0;
test_queue = ds_queue_create();
test_x = 0;
test_count = 0;
fail_count = 0;

test_plan = "1.."+string(test_count);
test_lines = "";
test_results = "";
custom_action = ""
custom_type = ""
current_test = "";
script_execute(test_list);

#define run_hobo_tests
/// run_hobo_tests()
with(TEST) {
  if(!ds_queue_empty(test_queue)) {
    var test_item = ds_queue_dequeue(test_queue);
    current_test = test_item;
    alarm[2] = 5;
  }
}
return 1;

#define trigger_test
/// trigger_test()
var test_array = argument[0];
var test_type = test_array[0];
switch(test_type) {
  case "obj_exists":
    var obj = test_array[1];
    run_test()
    if(instance_exists(obj)) {
      pass();
    } else {
      fail("# EXPECTED object to exist: "+object_get_name(obj));
    }
    break;
  case "do_thing":
    var action = test_array[1];
    var type = test_array[2];
    if(action == "keypress") {
      custom_action = action;
      custom_type = type;
      alarm[1] = 1;
    } else if(action == "mouseclick") {
      custom_action = action;
      custom_type = type;
      alarm[1] = 1;
    }
    break;
  case "it":
    description = test_array[1];
    expected = test_array[2];
    actual = test_array[3]
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
    break;
  case "instance_of":
    object = test_array[1];
    element = test_array[2];
    run_test();
    found = false;
    for(i=0;i<instance_number(object)-1;i++)
      {
        o_id = instance_find(object, i);
        if(o_id == element)
          {
            pass();
            break;
          }
      }
      fail("instance_of failed: "+object_get_name(object));
      break;
  case "should_be":
    expected_value = test_array[1];
    obj = test_array[2];
    instance_var = test_array[3];
    run_test();
    obj_id = instance_find(obj, 0).id;
    actual_value = variable_instance_get(obj_id, instance_var);
    if(actual_value == expected_value) {
      pass();
      break;
    } else{
      fail("Expected "+instance_var+" to be "+string(expected_value)+ " was "+string(actual_value));
      break;
    }
}

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
ds_queue_enqueue(test_queue, create_array("instance_of", object, element));
return 0;

#define create_array
var i = argument_count;
var m = array_create(i);

while (--i >= 0) m[i] = argument[i];
return m;


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
ds_queue_enqueue(test_queue, create_array("it", description, expected, actual));
return 0;

#define obj_exists
/// obj_exists(val:T)->int
obj = argument[0]
ds_queue_enqueue(test_queue, create_array("obj_exists", obj));
return 0;

#define do_thing
/// do_thing(val:T, val:T)->bool
action = argument[0]
type = argument[1]
ds_queue_enqueue(test_queue, create_array("do_thing", action, type));
return 0;

#define run_custom_action
/// run_custom_action()
if(custom_action == "keypress") {
  keyboard_key_press(custom_type);
  keyboard_key_release(custom_type);
} else if(custom_action == "mouseclick") {
  var cx = custom_type[0];
  var cy = custom_type[1];
  window_mouse_set(cx, cy);
  external_call(global.__simulate_click);
  // XXX: this does not work like it should
  //event_perform_object(obj_picture_character_select, ev_mouse, ev_left_press);
  //event_perform_object(obj_picture_character_select, ev_mouse, ev_left_release);
}
return 0;

#define should_be
/// should_be(arg, arg, arg)
var expected_value = argument[0];
var obj = argument[1];
var instance_var = argument[2];
ds_queue_enqueue(test_queue, create_array("should_be", expected_value, obj, instance_var));
return 0

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
