# MbcsRs

[![Build Status](https://travis-ci.org/enpedasi/mbcs_rs.svg?branch=master)](https://travis-ci.org/enpedasi/mbcs_rs)

Charactor encoding support for Elixir. using [ruster](https://github.com/hansihe/rustler) & ["rust-encoding"](https://crates.io/crates/encoding) crate. (Shift-JIS, EUC-JP, Big5.. other WHATWG encoding)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mbcs_rs` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mbcs_rs, "~> 0.1.0"}
  ]
end
```

Usage:

```elixir
iex> MbcsRs.encode!("日本語", "SJIS") |> MbcsRs.decode!("SJIS")
日本語

iex> File.stream!("KEN_ALL.CSV") \
 |> Stream.map(&MbcsRs.decode!(&1,"SJIS")) \
 |> Stream.filter(&String.contains?(&1,"福岡市中央区")) \
 |> Enum.to_list
["40133,\"810  \",\"8100000\",\"ﾌｸｵｶｹﾝ\",\"ﾌｸｵｶｼﾁﾕｳｵｳｸ\",\"ｲｶﾆｹｲｻｲｶﾞﾅｲﾊﾞｱｲ\",\"福岡県\",\"福岡市中央区\",\"以下に掲載がない場合\",0,0,0,0,0,0\n",
...
 "40133,\"810  \",\"8100037\",\"ﾌｸｵｶｹﾝ\",\"ﾌｸｵｶｼﾁﾕｳｵｳｸ\",\"ﾐﾅﾐｺｳｴﾝ\",\"福岡県\",\"福 岡市中央区\",\"南公園\",0,0,0,0,0,0\n",
 "40133,\"810  \",\"8100022\",\"ﾌｸｵｶｹﾝ\",\"ﾌｸｵｶｼﾁﾕｳｵｳｸ\",\"ﾔｸｲﾝ\",\"福岡県\",\"福岡市中央区\",\"薬院\",0,0,1,0,0,0\n",
 ...]
```

Supporting Other Encodings. See [WHATWG encoding spec](https://encoding.spec.whatwg.org/)


## requirement

Rust compiler & cargo

example for alpine linux
```sh
apk add musl-dev rust cargo 
```
