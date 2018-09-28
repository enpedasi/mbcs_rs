defmodule MbcsRs do
  @moduledoc """
  Documentation for MbcsRs.
  """

  @doc """
  Charactor encoding support for Elixir. using [ruster](https://github.com/hansihe/rustler) &    ["rust-encoding"](https://crates.io/crates/encoding) crate. (Shift-JIS, EUC-JP, Big5.. other   WHATWG encoding)

  ## Examples

      iex> MbcsRs.encode!("日本語", "SJIS") |> MbcsRs.decode!("SJIS")
      日本語

      iex> File.stream!("KEN_ALL.CSV") \
       |> Stream.map(&MbcsRs.decode!(&1,"SJIS")) \
       |> Stream.filter(&String.contains?(&1,"福岡市中央区")) \
       |> Enum.to_list
      ["40133,\"810  \",\"8100000\",\"ﾌｸｵｶｹﾝ\",\"ﾌｸｵｶｼﾁﾕｳｵｳｸ\",...
      ...
       "40133,\"810  \",\"8100037\",\"ﾌｸｵｶｹﾝ\",\"ﾌｸｵｶｼﾁﾕｳｵｳｸ\",...
      ]

  """
  use Rustler, otp_app: :mbcs_rs, crate: :mbcs_rs

  @spec decode_sjis!(binary) :: binary
  def decode_sjis!(_a), do: exit(:nif_not_loaded)

  @spec encode_sjis!(binary) :: binary
  def encode_sjis!(_a), do: exit(:nif_not_loaded)

  @spec decode!(binary, binary) :: binary
  def decode!(_a, _b), do: exit(:nif_not_loaded)

  @spec encode!(binary, binary) :: binary
  def encode!(_a, _b), do: exit(:nif_not_loaded)
end
