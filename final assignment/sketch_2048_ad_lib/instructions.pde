boolean atInstructions = false;

void instructions() {
  // backdrop
  noStroke();
  fill(0, 50, 73, 242.25); // slightly transparent so players can see their progress is not lost (last number is alpha on a scale of 0 - 255)
  rect(100, 117, 476, 476, 11);

  // title
  fill(255);
  textSize(50);
  text("how to play", 122, 135);

  // instructions
  textSize(18);
  text("- the goal of the game is to make a 2048 tile\n\n- move tiles around with the arrow keys or WASD\n\n- when tiles are adjacent and the same number, they will merge in the appropriate direction to make a tile that is their sum\n\n- the game ends when no moves are possible or you’ve made a 2048 tile\n\n- in easy mode, you can manually rearrange tiles 3 times throughout the game (as long as there is at least one open spot) by clicking ‘rearrange’ and dragging tiles to their new spots; click save when you're done\n\n- in hard mode, tiles are randomlly rearranged every 15 moves\n\n- your score is the sum of all the tiles you have merged\n- theres is a 1k point penalty for each manually moved tile, and a 2k bonus every time the tiles are shuffled", 122, 204, 434, 342);
}
