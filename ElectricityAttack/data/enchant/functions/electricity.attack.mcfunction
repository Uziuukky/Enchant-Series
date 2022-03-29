scoreboard objectives add electricity minecraft.custom:minecraft.damage_dealt

execute as @a[scores={electricity=1..},nbt=!{SelectedItem:{tag:{Ele:1b}}}] at @s run scoreboard players set @s electricity 0
execute as @a[scores={electricity=1..}] at @s unless entity @e[distance=0.001..5] run scoreboard players set @s electricity 0

execute as @a[scores={electricity=1..},nbt={SelectedItem:{tag:{Ele:1b}}}] at @s run tag @e[sort=nearest,distance=0.001..5,limit=1] add thunder.target
execute as @a[scores={electricity=1..}] at @s if entity @e[tag=thunder.target] run scoreboard players set @s electricity 0
execute as @e[tag=thunder.target] at @s run summon minecraft:lightning_bolt ~ ~ ~
execute as @e[tag=thunder.target] at @s run particle minecraft:electric_spark ~ ~1 ~ 0.3 0.5 0.3 1 30 force @a
execute as @e[tag=thunder.target] at @s run tag @s remove thunder.target

execute as @a[scores={electricity=1..},nbt={SelectedItem:{tag:{Ele:2b}}}] at @s run tag @e[sort=nearest,distance=0.001..7,limit=1,tag=!thunder.target2] add thunder.target
execute as @a[scores={electricity=1..},nbt={SelectedItem:{tag:{Ele:2b}}}] at @s run tag @e[sort=random,distance=0.001..7,limit=1,tag=!thunder.target] add thunder.target2
execute as @a[scores={electricity=1..}] at @s if entity @e[tag=thunder.target] run scoreboard players set @s electricity 0
execute as @e[tag=thunder.target2] at @s run summon minecraft:lightning_bolt ~ ~ ~
execute as @e[tag=thunder.target2] at @s run particle minecraft:electric_spark ~ ~1 ~ 0.3 0.5 0.3 1 30 force @a
execute as @e[tag=thunder.target2] at @s run tag @s remove thunder.target2

execute as @e[tag=ele.item] at @s run give @s diamond_sword{display:{Name:'{"text":"다이아몬드 검","color":"aqua","italic":false}',Lore:['{"text":"전격 1","color":"gray","italic":false}']},HideFlags:1,Ele:1b,Enchantments:[{id:"minecraft:sharpness",lvl:0s}]} 1
execute as @e[tag=ele.item] at @s run tag @s remove ele.item

execute as @e[tag=ele.item2] at @s run give @s diamond_sword{display:{Name:'{"text":"다이아몬드 검","color":"aqua","italic":false}',Lore:['{"text":"전격 2","color":"gray","italic":false}']},HideFlags:1,Ele:1b,Ele:2b,Enchantments:[{id:"minecraft:sharpness",lvl:0s}]} 1
execute as @e[tag=ele.item2] at @s run tag @s remove ele.item2