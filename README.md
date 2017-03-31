# Hobo Test
Packaged test framework that can be dragged into any project (tested w/ GM Studio 1).
![](http://i.imgur.com/GJXpsJI.gif)

# Getting Started
- Select the folder for the version of Gamemaker you are running
- Extract the scripts into your project (shown in above `gif`)
- If you are using GM:Studio 1 you can simply drag the TEST object into your project
- If you are using GM:Studio 2 you will have to manually create the object `TEST` (name is very important and cannot be changed or the framework will not work). Locate `TEST.obj.txt` and follow along with the copy paste instructions in the file

If the above steps have been completed correctly you can add your `TEST` object into the room you want to test and the results will be printed on the screen.

Hobo Test is built to be used in the least intrusive manner as possible to maximize the easy of introduction into any project you might want to test in the traditional sense.

More complicated test setups can be achieved but require some prying into events of various objects (e.g. adding 1 liner to Step event)
## Basic Assertions
### it(description, expected, result)
> Fails if expected != result
```c
it("should set draw_map flag to false on create", false, draw_map);
```
### instance_of(object_type, object_id)
> Fails unless `object_id` is of `object_type` or has a parent `object_type`
```c
instance_of(obj_tile, ds_stack_pop(graph));
```
### they_exist(object1, ...)
> *Not implemented*
> Fails if any object in the argument list is not present
```c
they_exist(obj_player, obj_hud, obj_wall);
```

## Controlling Step Logic
### hobo_freeze()
> Freeze all objects that are "freezable" and continue with testing
### hobo_thaw()
> Resume step logic for all "freezable" objects

