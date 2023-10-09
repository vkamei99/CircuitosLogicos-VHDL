library ieee;
use ieee.std_logic_1164.all;

entity main is
   port(
      sw    :   std_logic_vector(8 downto 0);
      led   :   std_logic_vector(4 downto 0)
   );
end main;

architecture main_arch of main is
    signal A, B, Bn, s1, s2 : std_logic_vector(3 downto 0);
    signal Co               : std_logic;
begin
    A <= sw(3 downto 0);
    B <= sw(7 downto 4);
    Bn <= not B;

    n_bit_2x1: entity work.mux2_1(cond_arch)
        port map(
            i0 => B,
            i1 => Bn,
            sel => sw(8),
            y => s1
        );
    
    adder_cin: entity work.somador(somador_arch)
        port map(
            a => A,
            b => s1,
            ci => sw(8),
            s => s2,
            co => Co
        );

    led(4) <= (A(3) and s1(3) and not(s2(3))) or (not(A(3)) and not(s1(3)) and s2(3));
    led(3 downto 0) <= s2;

end main_arch;
