#Hobo Test
Prepackaged test framework that can be dragged into any project.

##Basic Assertions
###Single assertions
```ruby
# it(description, expected, result)
it("should set draw_map flag to false on create", false, draw_map);
```
###Object(s) Existance

```ruby
# they_exist(object1, ...)
they_exist(obj_player, obj_hud, obj_wall);
```
###Verify Object type
```ruby
# instance_of(object_type, object_id)
instance_of(o_tile, ds_stack_pop(graph));
```

