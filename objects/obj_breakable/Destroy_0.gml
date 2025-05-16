/// obj_breakable → Destroy
// audio_play_sound(snd_brick_break, 0, false);   // sound

var pieces = 6;                                // number of pieces
for (var i = 0; i < pieces; i++)
{
    var ang = irandom(359);
    var spd = 2 + random(1);

    var p = instance_create_layer(x, y, "Instances", obj_brick_debris);
    p.direction = ang;
    p.speed     = spd;
}
