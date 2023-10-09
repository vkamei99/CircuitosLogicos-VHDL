library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity g_top is
    Port ( 
        sw : in STD_LOGIC_VECTOR (3 downto 0);
        led : out STD_LOGIC_VECTOR (3 downto 0));
end g_top;

architecture arch of g_top is
begin
   teste : entity work.g_inc(indirect_arch)
      port map(
        g => sw,
        g1 => led
      );
end arch;
