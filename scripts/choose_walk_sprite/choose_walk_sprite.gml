function choose_walk_sprite(_d)
{
    switch (_d)
    {
        case "U": return spr_player_walk_up;
        case "D": return spr_player_walk_down;
        case "L": return spr_player_walk_left;
        case "R": return spr_player_walk_right;
    }
    return spr_player_walk_down; // 默认walk=down
}
