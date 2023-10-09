library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(
        a, b, ci : in std_logic;
        s, co : out std_logic
    );
end full_adder;

architecture fa_arch of full_adder is
begin
    co <= (b and ci) or (a and ci) or (a and b);
    s <= a xor b xor ci;
end fa_arch;
