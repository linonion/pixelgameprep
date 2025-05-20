///init for debugging
if (!variable_instance_exists(id, "lines") || array_length(lines) == 0) {
    lines = ["(Empty)"];
}
if (!variable_instance_exists(id, "speaker")) {
    speaker = "";
}
if (!variable_instance_exists(id, "target_room"))  target_room  = -1;  

index       = 0;
progress    = 0;
spd         = 0.8;           
last_char   = 0;             // for sound

if (!variable_global_exists("dialog_cd")) global.dialog_cd = 0;