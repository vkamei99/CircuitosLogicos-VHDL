library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   
entity g_inc is
   port(
      g: in std_logic_vector(3 downto 0);
      g1: out std_logic_vector(3 downto 0)
   );
end g_inc ;

architecture direct_arch of g_inc is
begin
   with g select
      g1 <= "0001" when "0000",
            "0011" when "0001",
            "0010" when "0011",
            "0110" when "0010",
            "0111" when "0110",
            "0101" when "0111",
            "0100" when "0101",
            "1100" when "0100",
            "1101" when "1100",
            "1111" when "1101",
            "1110" when "1111",
            "1010" when "1110",
            "1011" when "1010",
            "1001" when "1011",
            "1000" when "1001",
            "0000" when others; -- "1000"
end direct_arch;

architecture indirect_arch of g_inc is
-- crie aqui os sinais intermediários que recebem os resultados de cada nível
    signal b,binc        : std_logic_vector(3 downto 0); 
    signal v,v1    : unsigned(3 downto 0);
begin
       -- primeiro nível, conversão de Gray para binário
	b(3) <= g(3);
	b(2) <= g(3) xor g(2);
	b(1) <= g(3) xor g(2) xor g(1);
	b(0) <= g(3) xor g(2) xor g(1) xor g(0);
   -- segundo nível, incrementador binário
    v <= unsigned(b);
    v1 <= v + 1;
    binc <= std_logic_vector(v1);
   -- terceiro nível, conversão de binário para Gray
    g1(3) <= binc(3);
    g1(2) <= binc(3) xor binc(2);
    g1(1) <= binc(2) xor binc(1);
    g1(0) <= binc(1) xor binc(0);

end indirect_arch;

