library ieee;
use ieee.std_logic_1164.all;

entity d_ff_async is
    port (
        clk : in  std_logic;
        D   : in  std_logic;
        set : in  std_logic;
        clr : in  std_logic;
        Q   : out std_logic;
        Qn  : out std_logic
    );
end d_ff_async;

architecture behavioral of d_ff_async is
    signal q_int : std_logic := '0';
begin
    -- set and clr MUST be in the sensitivity list
    -- so the FF reacts immediately without waiting for clk
    process (clk, set, clr)
    begin
        if clr = '1' then              -- 1st priority : Clear
            q_int <= '0';
        elsif set = '1' then           -- 2nd priority : Set
            q_int <= '1';
        elsif rising_edge(clk) then    -- 3rd : normal D FF operation
            q_int <= D;
        end if;
    end process;

    Q  <= q_int;
    Qn <= not q_int;
end behavioral;