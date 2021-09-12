class Dialogue {
  String text, face, passiveText;
  int frames, i;
  
  Dialogue(String text, String face) {
    passiveText = "";
    this.text = text;
    this.face = face;
    i = 0;
  }

  Dialogue(JSONObject dialogueJSON) {
    text = dialogueJSON.getString("text");
    face = dialogueJSON.getString("face");
  }

  JSONObject serialize() {
    JSONObject dialogueJSON = new JSONObject();
    dialogueJSON.setString("text", text);
    dialogueJSON.setString("face", face);
    return dialogueJSON;
  }
}
