library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity shifter_test is
    generic (n : integer := 8);
   port(
      sw  : in  std_logic_vector(n+1 downto 0);
      btn : in  std_logic_vector(2 downto 0);
      led : out std_logic_vector(n-1 downto 0)
   );
end shifter_test;

architecture arch of shifter_test is
begin
   shift_unit : entity work.shifter_multi2(arch)
      port map(
         shr_1 => btn(0), 
         shr_1c => btn(1),
         shl_1 => btn(2),
         x_n => sw(9),
         x => sw(8 downto 1),
         x_minus1 => sw(0),
         s => led(7 downto 0)
      );
end arch;