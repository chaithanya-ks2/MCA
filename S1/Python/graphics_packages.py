# Importing specific modules or functions
from Graphics.Rectangle import area as rect_area, perimeter as rect_perimeter
from Graphics.Circle import area as circle_area, perimeter as circle_perimeter
from Graphics.ThreeD_Graphics.Sphere import area as sphere_area, volume as sphere_volume
from Graphics.ThreeD_Graphics.Cuboid import area as cuboid_area, volume as cuboid_volume

print(rect_area(2,2))
print(rect_perimeter(2,2))
print(circle_area(3))
print(circle_perimeter(3))

print(sphere_area(4))
print(sphere_volume(4))
print(cuboid_area(1,2,3))
print(cuboid_volume(1,2,3))

#importing using *
from Graphics import *
from Graphics.ThreeD_Graphics import *

print(Rectangle.area(2, 2))
print(Rectangle.perimeter(2, 2))
print(Circle.area(3))
print(Circle.perimeter(3))

print(Sphere.area(4))
print(Sphere.volume(4))
print(Cuboid.area(1, 2, 3))
print(Cuboid.volume(1, 2, 3))
