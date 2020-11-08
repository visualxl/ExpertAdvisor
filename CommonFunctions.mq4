//+------------------------------------------------------------------+
//|                                              CommonFunctions.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property show_inputs

//+------------------------------------------------------------------+
//| Inputs to be specified by the user                                   |
//+------------------------------------------------------------------+
input double Risk; //Risk per trade in %.
input double InitStopLoss; //Stop Loss in pips on m1 chart.
//input double StopFactor; //Stop Loss multiplier.
input double ProfitFactor; //TP multipler in relation to SL.

//+------------------------------------------------------------------+
//| Calculate the lot size                                   |
//+------------------------------------------------------------------+

double calculateLotSize (double risk, double stopLoss) {
   double tradeAmount = AccountFreeMargin() * risk / 100;
   double lotSize = tradeAmount / stopLoss;
   
   if (lotSize < MODE_MINLOT)
      return 0;
   else
      return lotSize;
}

//+------------------------------------------------------------------+
//| Set Stop Loss in pips                                            |
//+------------------------------------------------------------------+
double setSL(double initStopLoss, int timeFrame) {
   double stopLoss =0;
   
   switch(timeFrame) {
      case 1:
         stopLoss = initStopLoss;
         break;
      case 5:
         stopLoss = MathPow(initStopLoss,2);
         break;
      case 15:
         stopLoss = MathPow(initStopLoss,3);
         break;
      case 60:
         stopLoss = MathPow(initStopLoss,4);
         break;
      case 240:
         stopLoss = MathPow(initStopLoss,5);
         break;
      case 1440:
         stopLoss = MathPow(initStopLoss,6);
         break;
   }
   
   return stopLoss;
}

//+------------------------------------------------------------------+
//| Set Take Profit in pips                                          |
//+------------------------------------------------------------------+
double setTP (double profitFactor) {
   double stopLoss = setSL(InitStopLoss, Period());
   return stopLoss * profitFactor;
}

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   
  }
//+------------------------------------------------------------------+
