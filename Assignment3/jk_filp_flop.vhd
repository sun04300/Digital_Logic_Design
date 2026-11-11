library ieee;
use ieee.std_logic_1164.all;

entity jk_ff is
    port (
        J    : in  std_logic;
        clk  : in  std_logic;
        K    : in  std_logic;
        CLRn : in  std_logic;
        Q    : out std_logic;
        Qn   : out std_logic
    );
end jk_ff;

architecture behavioral of jk_ff is
    signal q_int : std_logic := '0';
    signal jk    : std_logic_vector(1 downto 0);
begin
    jk <= J & K;

    -- CLRn is active-low and asynchronous (same as the gate circuit)
    process (clk, CLRn)
    begin
        if CLRn = '0' then
            q_int <= '0';                             -- Clear
        elsif rising_edge(clk) then
            case jk is
                when "00"   => q_int <= q_int;        -- Hold
                when "01"   => q_int <= '0';          -- Reset
                when "10"   => q_int <= '1';          -- Set
                when "11"   => q_int <= not q_int;    -- Toggle
                when others => q_int <= q_int;
            end case;
        end if;
    end process;

    Q  <= q_int;
    Qn <= not q_int;
end behavioral;