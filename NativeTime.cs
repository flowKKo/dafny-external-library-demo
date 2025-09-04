using System;
using System.Globalization;
using System.Linq;
using Dafny;

public static class NativeTime
{
    public static long Now() => DateTimeOffset.UtcNow.ToUnixTimeMilliseconds();

    public static ISequence<Rune> NowStr()
    {
        var s = DateTimeOffset.Now.ToString(
            "yyyy-MM-dd HH:mm:ss.fff zzz",
            CultureInfo.InvariantCulture
        );

        var runes = s.Select(c => new Rune((int)c)).ToArray();
        return Sequence<Rune>.FromArray(runes);
    }
}
