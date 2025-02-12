// Java program for visualization bootstrap calculations using simulations
//   by: <harald.weedon-fekjar@medisin.uio.no> 2022
//   Java : https://en.wikipedia.org/wiki/Java_(programming_language)

import java.util.Scanner;
import java.util.Random;
import java.util.Arrays;
import java.util.ArrayList;

class BootstrapSimEx {

  private static float[] introAskData() {
    System.out.print("\n\n\n");
    System.out.print("Welcome to an interative demostration of statistical bootstrapping");
    System.out.print("\n\n");
    Scanner input = new Scanner(System.in);
    System.out.print("Input comma seperated data: ");
    String datat = input.nextLine();
    System.out.println(datat);
    String[] datats = datat.split(",");
    float[] data = new float[datats.length];
    for (int i = 0; i < datats.length; ++i) {
      data[i] = Float.parseFloat(datats[i]);
    }
    return data;
  }

  private static float OneBootsample(Random rn, float[] dataA, boolean printres, int nb) {
    int noobs = dataA.length;
    float bootSum = 0;
    ArrayList<Float> boots = new ArrayList<Float>();
    String bootstr = "";
    for (int i = 0; i < noobs; i++) {
      int indno = rn.nextInt(noobs);
      float newval = dataA[indno];
      boots.add(newval);
      bootSum += newval;
      bootstr += String.valueOf(newval);
      if (i < noobs - 1) {
        bootstr += ", ";
      }
    }
    float bootsMean = bootSum / noobs;
    if (printres == true) {
      System.out.println("Bootstrap sample " + nb + ":");
      System.out.println(" Bootstrap sample: " + bootstr);
      System.out.printf(" Mean: %.1f\n", bootsMean);
    }
    return bootsMean;
  }

  public static void main(String[] args) {
    int noboot = 10000;
    float res[] = new float[noboot];
    boolean printRes = true;
    Random rn = new Random(3);
    Scanner input = new Scanner(System.in);
    float[] data = introAskData();
    System.out.println("\n\n\nRuning bootstrap ...");
    System.out.println("Hit <return> for new sample, S+<return> for sumerize/end\n");
    for (int i = 0; i < noboot; i++) {
      res[i] = OneBootsample(rn, data, printRes, i + 1);
      if (printRes) {
        String ans = input.nextLine();
        if (ans.length() > 0) {
          if (ans.charAt(0) == 'S' || ans.charAt(0) == 's') {
            printRes = false;
          }
        }
      }
    }
    Arrays.sort(res);
    float ciP1 = noboot *(float)0.025 - (float)1;
    float ci1 = res[(int) ciP1];
    float ciP2 = noboot *(float)0.975 - (float)1;
    float ci2 = res[(int) ciP2];
    System.out.println("...\n...\n...\n...\n...\n\n");
    System.out.print("\n\n95% bootstrap percentile confidence interval: ");
    System.out.printf("[%.1f, %.1f]\n",ci1,ci2);
    System.out.printf("(based on %d bootstrap replications)\n\n", noboot);
    String finished = input.nextLine();
  }
}
