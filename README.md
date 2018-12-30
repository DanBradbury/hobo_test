# Hobo Test
Packaged test framework that can be dragged into any project (tested w/ GM Studio 1).
![](https://i.imgur.com/OnZhbzU.gif)

# How it works
Import the extension (drag into IDE) and add the `TEST` object to your first room

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
