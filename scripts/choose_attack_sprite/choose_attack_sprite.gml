function choose_attack_sprite(_d, _idx)
{
    if (_idx == 1) { // ATK1
        switch (_d) {
            case "U": return spr_player_atk1_up;
            case "D": return spr_player_atk1_down;
            case "L": return spr_player_atk1_left;
            case "R": return spr_player_atk1_right;
        }
    } else {  // ATK2
        switch (_d) {
            case "U": return spr_player_atk2_up;
            case "D": return spr_player_atk2_down;
            case "L": return spr_player_atk2_left;
            case "R": return spr_player_atk2_right;
        }
    }
    return spr_player_atk1_down; // 默认attackdown
}
