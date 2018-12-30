# Hobo Test
Packaged test framework that can be dragged into any project (tested w/ GM Studio 1)
![](https://i.imgur.com/OnZhbzU.gif)

# Usage
Grab the [latest `.gmez` from Releases](https://github.com/DanBradbury/hobo_test/releases) or download the source and build yourself (see instructions below for requirements / setup)

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

# Building Yourself
First make sure you have [`7zip` installed](https://www.7-zip.org/) and added to your `PATH`. You should be able to open Powershell and have the `7z` command return usage info.

Double-click / run `clean_make.bat` and it should create a working `hobo_test.gmez` from the local files for you to use

# Editting
The `.gmx` file may have a warning about editting it manually but.. dont worry its not that complicated. It's just XML so feel free to edit at will. Just know the compiler needs this info when it uses the `gmez`

*Add more info here to help folks get started with gmx / GML basics*
