library ieee;
use ieee.std_logic_1164.all;

entity rs_latch is
    port (
        S  : in  std_logic;
        R  : in  std_logic;
        Qn : out std_logic;
        Q  : out std_logic
    );
end rs_latch;

architecture gate_level of rs_latch is
    signal q_int  : std_logic;
    signal qn_int : std_logic;
begin
    -- upper NOR gate : S, Q  -> Qn
    qn_int <= S nor q_int;

    -- lower NOR gate : R, Qn -> Q
    q_int  <= R nor qn_int;

    Qn <= qn_int;
    Q  <= q_int;
end gate_level;