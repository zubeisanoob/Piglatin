public void setup() {
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) {
	  System.out.println(pigLatin(lines[i]));
	}
}

public void draw()
{
    //not used
}

// Ok it took me way too long to understand recursion
// but it finally makes sense and oh my GODDDD!!!!
// I'm sorry this is submitted late I just couldn't figure
// recursion out and finally finally finally it clicked and I
// got the findFirstVowel working!!! I'm happy and slightly peeved :) 

public int findFirstVowel(String word){
  char[] vowels = {'a', 'e', 'i', 'o', 'u'};
  if (word.length() == 0 || word.equals("")) {
    return -1;
  } else {
    for (char vowel: vowels) {
      if (word.charAt(0) == vowel) {
        return 0;
      }
    }
  }
  int step = findFirstVowel(word.substring(1));
  return step == -1 ? -1 : 1 + step;
}


public String pigLatin(String sWord) {
    //precondition: sWord is a valid String of length greater than 0
    //postcondition: returns the pig latin equivalent of sWord
    if (findFirstVowel(sWord) == -1) {
        return sWord + "ay";
    } else if (findFirstVowel(sWord) == 0) {
        return sWord + "way";
    } else if (findFirstVowel(sWord) == 1 && sWord.substring(0, 2).equals("qu")) {
        return sWord.substring(2) + "quay";
    } else if (findFirstVowel(sWord) != 0 && findFirstVowel(sWord) != -1) {
        return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
    } else {
        return "ERROR!";
    }
}
