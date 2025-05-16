/// obj_player → Step  （整段替换）

// ───────────────────────────────────────────
// 0. 生命值检测
if (instance_exists(obj_dialogueBox)) exit;

if (hp <= 0) {
    room_restart();
    exit;
}

// 1. 输入向量
var h = keyboard_check(vk_right) - keyboard_check(vk_left);
var v = keyboard_check(vk_down)  - keyboard_check(vk_up);

// 2. 冲刺 or 常速
var cur_spd = keyboard_check(ord("A")) ? dash_spd : walk_spd;
hsp = h * cur_spd;
vsp = v * cur_spd;

// 3. 碰撞移动
x += hsp;  if (place_meeting(x,y,obj_solid)) x -= hsp;
y += vsp;  if (place_meeting(x,y,obj_solid)) y -= vsp;

// 4. 行走动画与朝向（仅在非攻击）
if (state == "IDLE")
{
    if (h != 0 || v != 0)
    {
        if (abs(h) >= abs(v))
            facing = (h > 0) ? "R" : "L";
        else
            facing = (v > 0) ? "D" : "U";

        /// 同时更新朝向角度
        switch (facing) {
            case "R": facing_angle = 0;   break;
            case "U": facing_angle = 90;  break;
            case "L": facing_angle = 180; break;
            case "D": facing_angle = 270; break;
        }

        sprite_index = choose_walk_sprite(facing);
        image_speed  = walk_anim_speed;
    }
    else
    {
        sprite_index = choose_walk_sprite(facing);
        image_speed  = 0;
        image_index  = 0;
    }
}

// 5. 攻击输入 + 冷却
if (atk_timer > 0) atk_timer--;

if (atk_timer <= 0 && state == "IDLE")
{
    if (keyboard_check_pressed(ord("J")))
    {
        state        = "ATK1";
        attack_dir   = facing;
        sprite_index = choose_attack_sprite(attack_dir, 1);
        image_index  = 0;  
		image_speed  = atk1_anim_speed;
        atk_timer    = atk_cool;
        hit_done     = false;
    }
    else if (keyboard_check_pressed(ord("K")))
    {
        state        = "ATK2";
        attack_dir   = facing;
        sprite_index = choose_attack_sprite(attack_dir, 2);
        image_index  = 0;  
		image_speed  = atk2_anim_speed;
        atk_timer    = atk_cool;
        hit_done     = false;
    }
}

// 6. 关键帧判定（扇形）
if (state=="ATK1" && image_index>=2 && !hit_done) {
    scr_player_attack(atk1_range, 60);    
    hit_done = true;
}
else if (state=="ATK2" && image_index>=3 && !hit_done) {
    scr_player_attack(atk2_range, 90);      
    hit_done = true;
}

// 7. 攻击动画结束
if (state=="ATK1"||state=="ATK2")
{
    var last = sprite_get_number(sprite_index)-1;
    if (image_index >= last)
    {
        state = "IDLE";
        sprite_index = choose_walk_sprite(facing);
        image_speed  = (h!=0||v!=0) ? walk_anim_speed : 0;
        image_index  = 0;
        hit_done     = false;
    }
}

// ---- 边界钳制：确保角色始终在房间内 ----
var hw = sprite_width  * 0.5;   // 半宽
var hh = sprite_height * 0.5;   // 半高

x = clamp(x, hw, room_width  - hw);
y = clamp(y, hh, room_height - hh);
