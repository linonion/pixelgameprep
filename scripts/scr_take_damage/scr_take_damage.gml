function scr_take_damage(amount){
	hp -= amount; 
	if (hp <= 0) {
		instance_destroy();
	}
}

function scr_spawn_bullet(ent, _spd, _dir) {
    instance_create_layer(
        ent.x, ent.y, "Instances",
        obj_bullet,
        { spd: _spd, dir: _dir, owner_is_player: false }
    );
}
