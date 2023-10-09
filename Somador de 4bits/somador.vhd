library ieee;
use ieee.std_logic_1164.all;

entity somador is
   port(
      ci    :   in std_logic;
      a,b   :   in std_logic_vector(3 downto 0);
      s     :   out std_logic(3 downto 0);
      co    :   out std_logic
   );
end somador;

architecture somador_arch of somador is
    signal s1, s2, s3 : std_logic;
begin
    full_adder_1 : entity work.full_adder(fa_arch)
        portmap(
            ci => ci,
            a => a(0),
            b => b(0),
            s => s(0),
            co => s1
        );
    full_adder_2 : entity work.full_adder(fa_arch)
        portmap(
            ci => s1,
            a => a(1),
            b => b(1),
            s => s(1),
            co => s2
        );
    full_adder_3 : entity work.full_adder(fa_arch)
        portmap(
            ci => s2,
            a => a(2),
            b => b(2),
            s => s(2),
            co => s3
        );
    full_adder_4 : entity work.full_adder(fa_arch)
        portmap(
            ci => s3,
            a => a(3),
            b => b(3),
            s => s(3),
            co => co
        );
   
end somador_arch;