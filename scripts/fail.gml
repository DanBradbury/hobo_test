/**
* Track that the test failed
*/
TEST.result[TEST.test_count] = c_red;
text += "#  EXPECTED: "+string(argument[1])+" WAS: "+string(argument[2]);
TEST.failing_tests[TEST.fail_count] = text;
TEST.fail_count += 1;