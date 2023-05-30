class HomeScreeViewModel {

 static String Trimstring(string) {
    if (string.length < 15) {
      return string;
    } else {
      String text = string.substring(0, 16) + '...';
      return text;
    }
  }

 static List<Map<String, dynamic>> historyItems = [
   {
     "issuer": "ID ventures",
     "account": "2467 4534 4532 6654",
     "amount": "2500,000.00",
   },
   {
     "issuer": "Greory Aidoo Richardson",
     "account": "2467 4534 4532 6654",
     "amount": "1,025.00",
   },
   {
     "issuer": "Yestech Ghana Incorporated",
     "account": "2467 4534 4532 6654",
     "amount": "1,800,025.00",
   },
   {
     "issuer": "Yestech Ghana Incorporated",
     "account": "2467 4534 4532 6654",
     "amount": "1,800,025.00",
   },
   {
     "issuer": "Yestech Ghana Incorporated",
     "account": "2467 4534 4532 6654",
     "amount": "1,800,025.00",
   },
 ];


}