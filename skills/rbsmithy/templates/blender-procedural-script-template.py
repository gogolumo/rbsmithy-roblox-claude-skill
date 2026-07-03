# RBSmithy procedural Blender asset template.
# Run inside Blender Text Editor.
# Start with small geometry, inspect, then scale.

import bpy
import bmesh
from mathutils import Vector
from math import radians

ASSET_NAME = "rbsmithy_asset"
CLEAR_SCENE = False
SCALE = 1.0

def clear_scene():
    bpy.ops.object.select_all(action="SELECT")
    bpy.ops.object.delete()

def mat(name, color):
    material = bpy.data.materials.new(name)
    material.diffuse_color = color
    return material

def apply_transforms(obj):
    bpy.context.view_layer.objects.active = obj
    obj.select_set(True)
    bpy.ops.object.transform_apply(location=False, rotation=True, scale=True)
    obj.select_set(False)

def create_block(name, location, scale, material):
    bpy.ops.mesh.primitive_cube_add(size=1, location=location)
    obj = bpy.context.object
    obj.name = name
    obj.dimensions = scale
    obj.data.materials.append(material)
    apply_transforms(obj)
    return obj

if CLEAR_SCENE:
    clear_scene()

primary = mat("RBSmithy_Primary", (0.45, 0.18, 0.80, 1))
dark = mat("RBSmithy_Dark", (0.08, 0.07, 0.10, 1))

root = create_block(ASSET_NAME + "_blockout", (0, 0, 1), (4*SCALE, 2*SCALE, 2*SCALE), primary)

print("Generated blockout. Inspect scale, origin, normals, material slots, and export only final objects.")
