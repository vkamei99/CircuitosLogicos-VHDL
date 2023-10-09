library ieee;
use ieee.std_logic_1164.all;

entity mux2_1 is
    port (
        i0, i1, sel : in std_logic;
        y : out std_logic
    );
end mux2_1;

architecture cond_arch of mux2_1 is
begin
    y <= i0 when sel = '0' else i1;
end cond_arch;
