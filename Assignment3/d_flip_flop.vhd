library ieee;
use ieee.std_logic_1164.all;

entity d_ff2 is
    port (
        D   : in  std_logic;
        clk : in  std_logic;
        Q   : out std_logic;
        Qn  : out std_logic
    );
end d_ff2;

architecture behavioral of d_ff2 is
    signal q_int : std_logic := '0';
begin
    process (clk)
    begin
        if rising_edge(clk) then
            q_int <= D;
        end if;
    end process;

    Q  <= q_int;
    Qn <= not q_int;
end behavioral;