// C# program for visualization bootstrap calculations using simulations
//   by: <harald.weedon-fekjar@medisin.uio.no> 2022
//   C# : https://en.wikipedia.org/wiki/C_Sharp_(programming_language)

  //// Principle:
  // - Ask user for comma separated data
  // - Shows bootstrap sample with observations and mean
  //   User asked to answer:
  //   N = Next sample, S = Show summarize confidence intervals

  ////  Run and build with:
  // dotnet run
  // dotnet build  // dotnet publish -r win-x64

using System;
using System.Collections.Generic;

class Program {
  
  static decimal OneBootsample(Random rand,decimal[] dataA, bool printRes,int nb) {
    int noobs = dataA.Length;
    var boots = new List<decimal>();
    for (int i=0; i<noobs; i++) {
      int indno = rand.Next(0,noobs);
			boots.Add(dataA[indno]);
		}
    decimal bootsMean = boots.Average();
    if (printRes) {
      Console.WriteLine("");
      Console.WriteLine("Bootstrap sample " + nb + ":");
      Console.WriteLine("   Bootstrap sample: "+String.Join(",",boots));
      Console.WriteLine("   Mean:             " + Math.Round(bootsMean,2));
    }
		return bootsMean;
  }

  public static void Main (string[] args) {
    int noboot = 10000;
    // Leser inn data:
    Console.Write("\n\n\n");
    Console.Write("Welcome to an interative demostration of statistical bootstrapping");
    Console.Write("\n\n");
    Console.Write("Input comma seperated data: ");
    string dataText = Console.ReadLine()!;
    decimal[] dataA = dataText.Split(',').Select(decimal.Parse).ToArray();
    // Kaller på bootstrap rutine:
    Console.WriteLine("\n\n\nRuning bootstrap ...");
    Console.WriteLine("Hit <return> for new sample, S for sumerize/end\n");
    var rand = new Random(3); 
    decimal  newres;
    char printA='n';
    bool printRes=true;
    var Res = new List<decimal>();
    for (int i=0; i<noboot; i++) {
      newres  = OneBootsample(rand,dataA,printRes,i+1);
      Res.Add(newres);
      if (printRes==true) { 
        printA = Console.ReadKey().KeyChar; 
      }
      if (printA=='S' || printA=='s') { printRes=false; }
    }
    // Oppsummerer:
    Res.Sort();
    decimal ci1 = Res[Convert.ToInt32(noboot*0.025-1)];
    decimal ci2 = Res[Convert.ToInt32(noboot*0.975-1)];
    Console.Write("...\n...\n...\n...\n...\n\n");
    Console.ForegroundColor = ConsoleColor.Blue;
    Console.Write("\n\n95% bootstrap percentile confidence interval: ");
    Console.WriteLine("[{0}, {1}]",Math.Round(ci1,2),Math.Round(ci2,2));
    Console.ResetColor();
    Console.Write("(based on {0} bootstrap replications)\n\n",noboot);
    char finishYes;
    finishYes = printA = Console.ReadKey().KeyChar;
  }
}
