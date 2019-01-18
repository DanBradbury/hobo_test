# Hobo Test
Packaged test framework that can be dragged into any project (tested w/ GM Studio 1)
![](https://i.imgur.com/OnZhbzU.gif)

# Usage
Grab the [latest `.gmez` from Releases](https://github.com/DanBradbury/hobo_test/releases) or download the source and build yourself. Drag the `.gmez` into your IDE and import all resources (double click on extension, click on Import, Select All and click OK).

Confirm that you have a `TEST` object, `test_list` script, and `hobo_dll` is added to Included Files.

Now you can start adding tests to your project.

# How it works
To get started I recommend you write tests that will be run when the first room is initialized (add `TEST` object to first room.) but nothing is preventing you from dynamically instantiating the `TEST` object to run during specific sections of gameplay.

With a `TEST` object inserted into a room you can add assertions to the `test_list` script and they will be triggered on the next game run.

Tests will be run in order they appear in the script to allow for the following
```c
do_thing("keypress", ord("I"));
obj_exists(obj_inventory_overlay);
do_thing("keypress", vk_escape);
it("should set user overlay flag to false", false, obj_player.draw_inventory_overlay);
```

## Basic Assertions
### it(description, expected, result)
> Passes if expected == result
```c
it("should set draw_map flag to false on create", false, draw_map);
```
### instance_of(object_type, object_id)
> Passes if `object_id` is of `object_type` or has a parent `object_type`
```c
instance_of(obj_tile, ds_stack_pop(graph));
```
### obj_exists(object)
> Passes if `instance_of(object)`
```c
obj_exists(obj_overlay);
```
### should_be(expected, object, instance_variable_name)
> Will dynamically lookup the instance_variable on the object (used in cases where variables are updated by events)
```c
// either it OR should_be would work IF #on_create inventory_slot_count=1
it("should be 1", 1, obj_character.inventory_slot_count);
should_be(1, obj_character, "inventory_slot_count");
do_thing("keypress", vk_enter); // picking up an item
should_be(2, obj_character, "inventory_slot_count");
``` 

## Simulating Gameplay
> Hobo Test has some built-in helper functions to help basic gameplay using basic commands
### do_thing(action, extra_info)
> Used to simulate keypress, mouse clicks, etc
```c
do_thing("keypress", ord("A")); // keypress takes a second argument that is the keycode
do_thing("mouseclick", pack(200, 500)); // mouseclick's second argument is an array with x,y coords
// pack() is a utility function provided by hobo_tools to simplify creating arrays
```

# Building Yourself
First make sure you have [`7zip` installed](https://www.7-zip.org/) and added to your `PATH`. You should be able to open Powershell and have the `7z` command return usage info.

Double-click / run `clean_make.bat` and it should create a working `hobo_test.gmez` from the local files for you to use

# Editting
The `.gmx` file may have a warning about editting it manually but.. dont worry its not that complicated. It's just XML so feel free to edit at will. Just know the compiler needs this info when it uses the `gmez`

*Add more info here to help folks get started with gmx / GML basics*
