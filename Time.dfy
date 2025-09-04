module Time {
  method {:extern "NativeTime", "Now"}    {:axiom} Now()    returns (ms:int) ensures ms >= 0
  method {:extern "NativeTime", "NowStr"} {:axiom} NowStr() returns (s:seq<char>) ensures |s| > 0
}

module Demo {
  import Time
  
  method Main() {
    var current := Time.Now();
    print "current timestamp = ", current, " ms\n";
    var ts := Time.NowStr();
    print "Current time str: ", ts, "\n";
  }
}
