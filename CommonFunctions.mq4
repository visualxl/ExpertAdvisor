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

input double Risk; //Risk per trade in %.

double calculateLotSize (double risk, double stopLoss) {
   double tradeAmount = AccountFreeMargin() * risk / 100;
   double lotSize = tradeAmount / stopLoss;
   
   if (lotSize < MODE_MINLOT)
      return 0;
   else
      return lotSize;
}

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   
  }
//+------------------------------------------------------------------+
