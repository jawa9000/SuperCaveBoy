/// exit_state

if (image_alpha > 0) {
    image_alpha -= 0.25; // fade out
} else {
    if (room != room_last) { // go to the next room
        room_goto_next();
    } else {
        //game_restart(); // restart the game after the last level has been passed
        
        // **** the player high score system doesn't work ****
        // calculate score
        score = obj_playerStats.sapphires; //* 10;
        
        // access an .ini file to pull/save data
        // open highscores
        ini_open("Settings.ini");
        obj_playerStats.highscore = ini_read_real("Score", "Highscore", 0);
        
        // new highstore
        if (score > obj_playerStats.highscore) {
            obj_playerStats.highscore = score;
            ini_write_real("Score", "Highscore", obj_playerStats.highscore);
        }
        
        // close the ini file
        ini_close();
        
       //ini_open("Cheese.ini");
        //ini_write_real("Greeting", "Hello", 0);
        //var message = ini_read_real("Greeting", "Hello", 0);
        //show_message(string(message));
        //ini_close();
        
        room_goto(rm_highscore);
    }
}
