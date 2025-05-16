/// obj_bullet  →  Step  （完整替换）

// ── 1. 直线运动 ─────────────────────────────────────
x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

// ── 2. 默认先检查墙体 / 破坏砖块 ────────────────────
if (place_meeting(x, y, obj_solid) || place_meeting(x, y, obj_breakable)) {
    instance_destroy();
    exit;
}

// ── 3. 检测另一颗子弹（可选：只炸掉自己）─────────────
if (place_meeting(x, y, obj_bullet) && instance_place(x, y, obj_bullet) != id) {
    instance_destroy();
    exit;
}

// ── 4. 检测命中目标 ────────────────────────────────
var target;

if (owner_is_player) {
    target = instance_place(x, y, obj_enemy_parent);   // 只伤害敌人
} else {
    target = instance_place(x, y, obj_player);         // 只伤害玩家
}

if (target != noone && target != id) {
    if (variable_instance_exists(target, "hp")) {
        with (target) scr_take_damage(1);
    }
    instance_destroy();
    exit;
}

// ── 5. 飞行寿命结束 ────────────────────────────────
if (--life <= 0) instance_destroy();
