defmodule MbcsRs do
  @moduledoc """
  Charactor encoding support for Elixir. using [Ruster](https://github.com/hansihe/rustler) and Rust lang [`encoding`](https://crates.io/crates/encoding) crate
  """

  use Rustler, otp_app: :mbcs_rs, crate: :mbcs_rs

  @doc """
  Mbcs Charactors decode to UTF-8

  ## Examples

      iex> MbcsRs.encode!("日本語", "SJIS") |> MbcsRs.decode!("SJIS")
      日本語

  """
  @spec decode!(binary, binary) :: binary
  def decode!(_binary, _whatwg_encoding), do: exit(:nif_not_loaded)

  @doc """
  UTF-8 strings encode to Mbcs Charactors.

  ## Examples

      iex> MbcsRs.encode!("日本語", "SJIS") |> MbcsRs.decode!("SJIS")
      日本語

  """
  @spec encode!(binary, binary) :: binary
  def encode!(_string, _whatwg_encoding), do: exit(:nif_not_loaded)
end
