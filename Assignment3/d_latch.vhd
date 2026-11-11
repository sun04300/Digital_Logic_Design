-- ============================================================
-- Exercise 2 : D Latch (with Enable, level-sensitive)
--   en = '1' : Q follows D (transparent)
--   en = '0' : keep previous state (Hold)
-- ============================================================
library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
    port (
        D  : in  std_logic;
        en : in  std_logic;
        Q  : out std_logic;
        Qn : out std_logic
    );
end d_latch;

architecture behavioral of d_latch is
    signal q_int : std_logic := '0';
begin
    process (D, en)
    begin
        if en = '1' then
            q_int <= D;
        end if;          -- en = '0' : no assignment -> Hold
    end process;

    Q  <= q_int;
    Qn <= not q_int;
end behavioral;