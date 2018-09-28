defmodule MbcsRsTest do
  use ExUnit.Case
  # doctest MbcsRs

  test "Basic" do
    assert_raise ArgumentError, fn ->
      MbcsRs.encode!("あいうえお", "none")
    end

    assert_raise ArgumentError, fn ->
      MbcsRs.decode!("あいうえお", "---")
    end

    assert MbcsRs.encode!("あいうえお壱弐参四五①②③④⑤", "sjis") |> MbcsRs.decode!("SJIS") ==
             "あいうえお壱弐参四五①②③④⑤"

    assert MbcsRs.encode!("あいうえお", "euc-jp") |> MbcsRs.decode!("euc-jp") == "あいうえお"

    assert MbcsRs.encode!("한국어", "euc-kr") |> MbcsRs.decode!("euc-kr") == "한국어"

    assert MbcsRs.encode!("你好，世界", "big5") |> MbcsRs.decode!("big5") == "你好，世界"

    assert MbcsRs.encode!("信息交换用汉字编码字符集", "GB2312") |> MbcsRs.decode!("GB2312") == "信息交换用汉字编码字符集"
  end
end
