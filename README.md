# Hobo Test
Packaged test framework that can be dragged into any project (tested w/ GM Studio 1).
![](http://i.imgur.com/GJXpsJI.gif)

# How it works
Add the scripts and object to your project and simply add the `TEST` object to your room that you want to run tests on
## Basic Assertions
### Single assertions
```c
# it(description, expected, result)
it("should set draw_map flag to false on create", false, draw_map);
```
### Object(s) Existance

```c
# they_exist(object1, ...)
they_exist(obj_player, obj_hud, obj_wall);
```
### Verify Object type
```c
# instance_of(object_type, object_id)
instance_of(obj_tile, ds_stack_pop(graph));
```
