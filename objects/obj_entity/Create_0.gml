// Create
max_hp = 1;
hp     = max_hp;

function scr_take_damage(_dmg) {
    hp -= _dmg;
    if (hp <= 0) instance_destroy();
}
