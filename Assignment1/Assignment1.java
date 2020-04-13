import java.io.*;

public class Assignment1 {

String word;
//List<Char> sequence = new ArrayList<>();

public static void sequenceReader(){
  FileReader fr = new FileReader();

  char c;
  int i;
  while ((i=fr.read()) != -1) {
    c = (char) i;
    //sequence.add(c);
    System.out.print(c);
  }
}


  public static int sequenceOne(String word){
    return 0;

  }

  public static int sequenceTwo(String word){
    return 0;
  }

  public static int sequenceThree(String word){
    return 0;
  }

  public static void main(String[] args) throws Exception {
    sequenceReader();
  }
}
