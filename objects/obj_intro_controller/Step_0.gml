switch (state)
{

    case 0:
        if (--delay_start <= 0)
        {
            var lines = scr_load_txt("intro.txt");
            instance_create_layer(0,0,"GUI", obj_dialogueBox,
                { lines: lines, speaker: "" });

            
            music_id = audio_play_sound(snd_home, 0, true);

            state = 1;
        }
        break;


    case 1:
        if (!instance_exists(obj_dialogueBox))
        {


            state       = 2;
            delay_after = room_speed * 5;   
        }
        break;


    case 2:
        if (--delay_after <= 0)
        {
            state = 3;   // 进入等待按空格阶段
        }
        break;


    case 3:
        if (keyboard_check_pressed(vk_space))
        {
            room_goto(rm_hub);
        }
        break;
}
