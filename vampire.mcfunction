scoreboard objectives add vampire minecraft.custom:minecraft.damage_dealt

execute as @a[scores={vampire=1..},nbt=!{SelectedItem:{tag:{Vam:1b}}}] at @s run scoreboard players set @s vampire 0
execute as @a[scores={vampire=1..}] at @s unless entity @e[distance=0.001..5] run scoreboard players set @s vampire 0

execute as @a[scores={vampire=1..},nbt={SelectedItem:{tag:{Vam:1b}}}] at @s run tag @e[scores={vampire=1..},distance=0.001..5,limit=1] add victim.vampire
execute as @e[tag=victim.vampire] at @s run particle minecraft:block redstone_block ~ ~1 ~ 0.2 0.3 0.2 0 20 force @a
execute as @e[tag=victim.vampire] at @s run playsound minecraft:block.stone.break master @s ~ ~ ~ 100 0.7 1
execute as @e[tag=victim.vampire] at @s run tag @s remove victim.vampire

execute as @a[scores={vampire=1..},nbt={SelectedItem:{tag:{Vam:1b}}}] at @s run effect give @s minecraft:instant_health 1 0 true
execute as @a[scores={vampire=1..},nbt={SelectedItem:{tag:{Vam:1b}}}] at @s run playsound minecraft:block.anvil.break master @s ~ ~ ~ 1000 1 1
execute as @a[scores={vampire=1..},nbt={SelectedItem:{tag:{Vam:1b}}}] at @s run particle minecraft:block redstone_block ~ ~1 ~ 0.2 0.3 0.2 0 20 force @a
execute as @a[scores={vampire=1..},nbt={SelectedItem:{tag:{Vam:1b}}}] at @s run particle minecraft:block redstone_block ~ ~1 ~ 0.2 0.3 0.2 0 20 force @a

execute as @e[tag=vam.item] at @s run give @s diamond_sword{display:{Name:'{"text":"다이아몬드 검","color":"aqua","italic":false}',Lore:['{"text":"흡혈 1","color":"gray","italic":false}']},HideFlags:1,TH:1b,Enchantments:[{id:"minecraft:sharpness",lvl:0s}]} 1
execute as @e[tag=vam.item] at @s run tag @s remove vam.item