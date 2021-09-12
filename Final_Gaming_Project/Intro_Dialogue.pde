class IntroDialogue
{
  ArrayList<Dialogue> dialogues;
  Dialogue d;
  String sFile, text;
  int scrollSpeed, strIndex, logueIndex, logueLimit;
  boolean canConfirm;

  IntroDialogue(String saveFile)
  {    
    text = "";
    scrollSpeed = 5;
    logueLimit = 1;
    logueIndex = 0;
    this.sFile = saveFile;
    dialogues = new ArrayList<Dialogue>();
    JSONObject textJSON = loadJSONObject(sFile);
    JSONArray dialoguesJSON = textJSON.getJSONArray("dialogue");
    for (int i = 0; i < dialoguesJSON.size(); i++) {
      dialogues.add(new Dialogue(dialoguesJSON.getJSONObject(i)));
    }
  }

  void intro() {
    background(0);
    d = dialogues.get(logueIndex);
    displayText(d.text, d.face);
  }

  void displayText(String inputText, String facialExpression) {
    fill(30);
    textSize(30);
    strokeWeight(7);
    stroke(255);
    rect(width*.33, height*.75, width*.4, 160);
    fill(255);
    image(loadImage(facialExpression + "goku_portrait.png"), width*0.332, height*0.725);

    if (strIndex > inputText.length()-1) {
      strIndex += 0;
      canConfirm = true;
      pushStyle();
      fill(0, 255, 0);
      textSize(25);
      text("Press Space to Continue", width*.33, height*.93);
      popStyle();
    } else {
      if (frameCount%scrollSpeed == 0) {
        text += inputText.charAt(strIndex);
        strIndex++;
      }
    }
    text(text, width*.43, height*.78, 550, 500);
  }

  void confirmControls() {
    if (key == ' ') {
      if (canConfirm && logueIndex < dialogues.size()-1) {
        scrollSpeed = 5;
        text = "";
        strIndex = 0;
        logueIndex++;
        canConfirm = false;
      } else {
        scrollSpeed = 1;
      }
    }
  }
}
