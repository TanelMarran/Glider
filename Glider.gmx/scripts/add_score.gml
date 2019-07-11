///add_score(size,enemies);
with(obj_score_keeper) {
var add = 0;
var circle_size_factor = circle_size_multiplier[4];
var size = argument[0];
var enemies = argument[1];

    for(var i = 0; i < array_length_1d(enemies); i++) {
        add += enemies[i].points_granted;
    }
    for(var i = 0; i < array_length_1d(circle_size_range); i++) {
        if(size < circle_size_range[i]) {
            circle_size_factor = circle_size_multiplier[i];
            break;
        }
    }
    add = add*circle_size_factor*player_multiplier
    player_score += add;
    player_combo += add;
}
