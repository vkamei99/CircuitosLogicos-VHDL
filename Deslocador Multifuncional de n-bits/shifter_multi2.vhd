library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter_multi2 is
    generic (n : integer := 8);
    port  (x_n      : in STD_LOGIC; 
           x        : in STD_LOGIC_VECTOR (n-1 downto 0);
           x_minus1 : in STD_LOGIC;
           shr_1    : in STD_LOGIC;
           shr_1c   : in STD_LOGIC;
           shl_1    : in STD_LOGIC;
           s        : out STD_LOGIC_VECTOR (n-1 downto 0));
end shifter_multi2;

architecture arch of shifter_multi2 is
signal c : std_logic_vector (1 downto 0);

begin
         c <= "11" when shr_1 = '1' else
         "10" when shr_1c = '1' else
         "01" when shl_1 = '1' else
         "00";
         
         with c select s <=
         x_n & x(n-1 downto 1) when "11",
         x(0) & x(n-1 downto 1) when "10",
         x(n-2 downto 0) & x_minus1 when "01",
         x(n-1 downto 1) & x(0) when others; 
end arch;