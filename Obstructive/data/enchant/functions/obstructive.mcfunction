scoreboard objectives add obstructive minecraft.custom:minecraft.damage_dealt

execute as @a[scores={obstructive=1..},nbt=!{SelectedItem:{tag:{Obs:1b}}}] at @s run scoreboard players set @s obstructive 0
execute as @a[scores={obstructive=1..}] at @s unless entity @e[distance=0.001..5] run scoreboard players set @s obstructive 0

execute as @a[scores={obstructive=1..},nbt={SelectedItem:{tag:{Obs:1b}}}] at @s run tag @e[sort=nearest,distance=0.001..5,limit=1] add attacked.obs
execute as @a[scores={obstructive=1..},nbt={SelectedItem:{tag:{Obs:1b}}}] at @s run playsound minecraft:block.anvil.place master @s ~ ~ ~ 0.5 0 1
execute as @a[scores={obstructive=1..},nbt={SelectedItem:{tag:{Obs:1b}}}] at @s run scoreboard players set @s obstructive 0

execute as @e[tag=attacked.obs] at @s run particle minecraft:smoke ~ ~1 ~ 0 0 0 0.5 30 force @a
execute as @e[tag=attacked.obs] at @s run particle item netherite_ingot ~ ~1 ~ 0 0 0 0.2 100 force @a
execute as @e[tag=attacked.obs] at @s run particle minecraft:crit ~ ~1 ~ 0 0 0 0.5 30 force @a
execute as @e[tag=attacked.obs] at @s run effect give @s minecraft:slowness 1 255 true
execute as @e[tag=attacked.obs] at @s run tag @s remove attacked.obs

execute as @e[tag=obs.item] at @s run give @s netherite_axe{display:{Name:'{"text":"네더라이트 도끼","color":"aqua","italic":false}',Lore:['{"text":"무력화 1","color":"gray","italic":false}']},HideFlags:1,Obs:1b,Enchantments:[{id:"minecraft:sharpness",lvl:0s}]} 1
execute as @e[tag=obs.item] at @s run tag @s remove obs.item